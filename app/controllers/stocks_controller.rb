class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      @buy_order = BuyOrder.new
      @sell_order = SellOrder.new
      @buy_orders = Stock.find_by(ticker: params[:stock]).buy_orders.pending
      @sell_orders = Stock.find_by(ticker: params[:stock]).sell_orders.pending
      @balance = current_user.wallets.total_balance
      if @stock.nil?
        flash.now[:alert] = 'Please enter a valid symbol to search'
        @run_js = false
      else
        @run_js = true
      end
    else
      flash.now[:alert] = 'Please enter a symbol to search'
      @run_js = false
    end
  end
end
