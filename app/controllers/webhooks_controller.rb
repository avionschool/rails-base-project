class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials[:stripe][:webhook]
      )
    rescue JSON::ParserError => e
      logger.error(e)
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      logger = Logger.new($stdout)
      logger.error('Signature error')
      logger.error(e)
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      logger = Logger.new($stdout)
      session = event.data.object
      payment_intent = session.payment_intent
      stripe = Stripe::PaymentIntent.retrieve(payment_intent)
      data = stripe.metadata

      logger.error("This is the data #{data}")
      @tourist_tour = TouristTour.create(
        tour_id: data.tour_id,
        tourist_id: data.tourist_id,
        amount_bought: data.total_amount,
        guest_quantity: data.guest_quantity,
        start_date: data.start_date,
        end_date: data.end_date
      )
      tour = Tour.find(data.tour_id)
      @travel_transaction = TravelTransaction.create(tourist_tour: @tourist_tour,
                                                     agency_id: tour.agency.id,
                                                     total_price: data.total_amount)
    end

    render json: { message: 'success' }
  end
end
