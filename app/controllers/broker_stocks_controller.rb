class BrokerStocksController < ApplicationController
  
  def create
    stock = Stock.new_search(params[:ticker])
    stock.added_by = current_broker.id
    if stock.blank?
      stock = Stock.new_search(params[:ticker])
      stock.save
    end
    @broker_stock = BrokerStock.create(broker: current_broker, stock: stock)
    flash[:notice] = "#{stock.name} was successfully added to your portfolio"
    redirect_to broker_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    broker_stock = BrokerStock.find_by(broker_id: current_broker.id, stock_id: stock.id)
    broker_stock.destroy
    flash[:notice] = "#{stock.ticker} was successfully removed from your portfolio."
    redirect_to broker_portfolio_path
  end
end
