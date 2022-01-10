class BrokerStocksController < ApplicationController
  def create
    stock = Stock.new_search(params[:ticker])
    if stock.blank?
      stock = Stock.new_search(params[:ticker])
      stock.save
    end
    @broker_stock = BrokerStock.create(broker: current_broker, stock: stock)
    flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
    redirect_to broker_portfolio_path
  end

end
