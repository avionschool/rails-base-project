class WebhooksController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials.dig(:stripe, :webhook)
      )
    rescue JSON::ParserError => e
      logger.error(e)
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      Rails.logger.debug 'Signature error'
      Rails.logger.debug(e)
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      @user = User.find_by(stripe_customer_id: session.customer)
      @user.update(status: 1)
    when 'customer.subscription.updated', 'customer.subscription.deleted'
      subscription = event.data.object
      @user = User.find_by(stripe_customer_id: subscription.customer)
      @user.update(
        subscription_status: subscription.status,
        plan: subscription.items.data[0].price.lookup_key
      )
    end

    render json: { message: 'success' }
  end
end
