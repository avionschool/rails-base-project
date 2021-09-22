class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      @buy_order = BuyOrder.new
      @sell_order = SellOrder.new
      if @stock.nil?
        flash.now[:alert] = 'Please enter a valid symbol to search'
      end
    else
        flash.now[:alert] = 'Please enter a symbol to search'
    end
  end
end
