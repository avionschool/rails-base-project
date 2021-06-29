class BuyerStocksController < ApplicationController
  before_action :authenticate_buyer!, exept: :show

  def index
    @buyer_stocks = current_buyer.buyer_stocks.order(:symbol)
  end

  def show
    @buyer_stock = current_buyer.buyer_stocks.find_by(params[:symbol])

    @client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.dig(:iex_cloud, :api_key),
      secret_token: Rails.application.credentials.dig(:iex_cloud, :secret_key),
      endpoint: 'https://cloud.iexapis.com/v1'
    )
  end

  def create
    @buyer_stock = current_buyer.user_transactions.build(buyer_stock_params)

    if @buyer_stock.save
      find_existing_buyer_stock(@buyer_stock)
    else
      redirect_to broker_stocks_path, alert: @buyer_stock.errors.full_messages.first
    end
  end

  private

  def buyer_stock_params
    params.require(:buyer_stock).permit(:broker_stock_id, :quantity, :total_price)
  end

  def find_existing_buyer_stock(buyer_stock)
    if current_buyer.buyer_stocks.any? { |stock| stock.symbol == buyer_stock.broker_stock.symbol }
      current_stock = current_buyer.buyer_stocks.find_by(symbol: buyer_stock.broker_stock.symbol)
      current_stock.quantity = current_stock.quantity + buyer_stock.quantity
      current_stock.save

      redirect_to buyer_stocks_path, notice: "Successfully bought #{@buyer_stock.broker_stock.symbol}"
    elsif current_buyer.buyer_stocks.none? { |stock| stock.symbol == buyer_stock.broker_stock.symbol }
      current_buyer.buyer_stocks.create(symbol: @buyer_stock.broker_stock.symbol, company_name: @buyer_stock.broker_stock.company_name, quantity: @buyer_stock.quantity)

      redirect_to buyer_stocks_path, notice: "Successfully bought #{@buyer_stock.broker_stock.symbol}"
    end
  end
end
