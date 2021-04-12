class BuyersController < ApplicationController
  def show
    @buyer = Buyer.find(params[:id])
    @categories = Service.distinct(:category).pluck(:category)
  end

  def filter
    @services = Service.where('lower(category) = ?', params[:category].downcase)
  end
end
