class BuyerController < ApplicationController
  before_action :authenticate_buyer!

  def index
    @all_stocks = Stock.all
  end

  def portfolio
    @bought_stocks = current_buyer.stock
end
