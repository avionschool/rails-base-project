class CheckoutsController < ApplicationController

  def create
    Stripe.api_key = Rails.application.credentials.stripe[:secret_key]
        @tour = Tour.find(params[:tour_id])
        @session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{ 
            name: @tour.name, 
            amount: (@tour.price * 100).to_i, 
            currency: 'usd', 
            quantity: params[:quantity] 
            }], 
        payment_intent_data: { 
          metadata: { 
            tourist_id: current_tourist.id,
            tour_id: @tour.id, 
            price: @tour.price,
            start_date: params[:start_date],
            end_date: params[:end_date],
            guest_quantity: params[:quantity],
            total_amount: params[:amount]
          } 
        }, 
        mode: 'payment',
        success_url: root_url,
        cancel_url: new_tourist_tour_url(@tour)
        })

        respond_to do |format|
            format.js
        end
  end
end
