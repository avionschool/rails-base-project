class StockHoldingsController < ApplicationController


  def new
    @stock = Stock.find(params[:stock_id])
    @balance = current_user.wallet.balance if current_user.wallet
    @holdings = current_user.stock_holding.build
  end

  def create
    
  end

  private

  
end
