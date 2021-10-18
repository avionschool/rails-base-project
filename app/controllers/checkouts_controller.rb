class CheckoutsController < ApplicationController
  def create
    @mini_book = MiniBook.all
    @mini_book = MiniBook.find(params[:id])
    Stripe.api_key = Rails.application.credentials.stripe[:secret]
    
    @session = Stripe::Checkout::Session.create({
    payment_method_types: ['card'],
    line_items: [{
      name: @mini_book.minibook_name,
        amount: (@mini_book.minibook_price * 100).to_i,
        currency: 'usd',
        quantity: 1
    }],
    # payment_intent_data: {
    #   metadata: {
    #     user_id: @mini_book.id,
    #     price: @mini_book.minibook_price,
    #     start_date: params[:start_date],
    #     end_date: params[:end_date],
    #     total_amount: params[:amount]
    #   }
    # },
    mode: 'payment',
    success_url: root_url,
    cancel_url: root_url,
   })
    respond_to do |format|
      format.js
    end
  end
end
