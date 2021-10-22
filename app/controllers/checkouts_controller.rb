class CheckoutsController < ApplicationController
  def create
    @abc_product = AbcProduct.all
    @abc_product = AbcProduct.find(params[:id])

    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
    line_items: [{
      name: @abc_product.product_name,
        amount: (@abc_product.product_price * 100).to_i,
        currency: 'usd',
        quantity: 1
    }],
    payment_intent_data: {
      # metadata: {
      #   user_id: @abc_product.id,
      #   price: @abc_product.product_price,
      #   start_date: params[:start_date],
      #   end_date: params[:end_date],
      #   total_amount: params[:amount]
      # }
    },
    mode: 'payment',
    success_url: root_url,
    cancel_url: root_url
                                                })
    respond_to do |format|
      format.js
    end
  end
end
