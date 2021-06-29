class BrokerStocksController < ApplicationController
  before_action :authenticate_user!
  
  def add_stock
    @stock = Stock.find(params[:id])
    current_user.stocks << @stock
    redirect_to stocks_path if current_user.save
  end

end
