class StockHoldingsController < ApplicationController
  include ApplicationHelper

  def new
    @stock = Stock.find(params[:stock_id])
    @balance = current_user.wallet.balance if current_user.wallet
    @holding = current_user.stock_holding.build
    @buy = stock_value_buy(@stock.current_price)
    @sell = stock_value_sell(@stock.current_price)
    @current_stock = current_user.stock_holding.find_by(stock_symbol: @stock.stock_symbol)
  end

  def create
    
  end

  private

  
end
