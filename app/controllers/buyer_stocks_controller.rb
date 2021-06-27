class BuyerStocksController < ApplicationController
  before_action :authenticate_buyer!, exept: :show

  def index
    @buyer_stocks = current_buyer.buyer_stocks
  end

  def show
    @buyer_stock = current_buyer.buyer_stocks.find(params[:id])
  end

  def create
    @buyer_stock = current_buyer.user_transactions.build(buyer_stock_params)

    if @buyer_stock.save
      current_buyer.buyer_stocks.create(symbol: @buyer_stock.broker_stock.symbol, company_name: @buyer_stock.broker_stock.company_name)
      redirect_to buyer_stocks_path, notice: "Successfully #{@buyer_stock.broker_stock.symbol}"
    else
      redirect_to broker_stocks_path, alert: @buyer_stock.errors.full_messages.first
    end
  end

  private

  def buyer_stock_params
    params.require(:buyer_stock).permit(:broker_stock_id)
  end
end
