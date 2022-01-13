class BuyerStocksController < ApplicationController
  before_action :set_buyer_stock, only: [ :show, :destroy ]
  def create
    stock = Stock.find(params[:stock][:stock_id])
    existing_stock = BuyerStock.check_db(params[:stock][:stock_id], current_buyer.id)
    if existing_stock
      if 
        new_total = existing_stock.quantity + params[:stock][:quantity].to_i
        existing_stock.update(quantity: new_total)
        @broker_transaction = Transaction.create(
          broker_id: stock.added_by, 
          broker_name: stock.brokers.first.broker_name, 
          buyer_email: current_buyer.email, 
          stock_id: stock.id, 
          buyer_id: current_buyer.id, 
          ticker: stock.ticker, 
          company_name: stock.name, 
          stock_price: stock.last_price, 
          quantity: params[:stock][:quantity]
        )
        flash[:notice] = "Successfully bought stock."
        redirect_to buyer_portfolio_path
      else
        params[:stock][:quantity].to_i < 1
        flash[:notice] = "Quantity cannot be less than 1"
        redirect_back(fallback_location: root_path)
      end
    else
      @buyer_stock = BuyerStock.create(
        buyer_id: current_buyer.id, 
        stock_id: stock.id, 
        quantity: params[:stock][:quantity], 
        stock_price: stock.last_price, 
        broker_id: stock.added_by)
      @broker_transaction = Transaction.create(
        broker_id: stock.added_by, 
        broker_name: stock.brokers.first.broker_name, 
        buyer_email: current_buyer.email, 
        stock_id: stock.id,
        buyer_id: current_buyer.id, 
        ticker: stock.ticker, 
        company_name: stock.name, 
        stock_price: stock.last_price, 
        quantity: params[:stock][:quantity]
      )
      flash[:notice] = "#{stock.name} was successfully bought."
      redirect_to buyer_portfolio_path
    end
  end
  def show
    @broker_stock = Stock.find(params[:id])
  end
  def destroy
    buyer_stock = BuyerStock.find_by(buyer_id: current_buyer.id, stock_id: params[:id])
    buyer_stock.destroy
    flash[:notice] = 'Stock was successfully removed from your portfolio.'
    redirect_to buyer_portfolio_path
  end
  private
  def set_buyer_stock
    @buyer_stock = Stock.find(params[:id])
  end
  # def buyer_stock_params
  #   params.require(:buyer_stock).permit(:quantity)
  # end
end