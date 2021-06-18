class StocksController < ApplicationController
  before_action :fetch_api, only: %i[index show create]

  def index; end

  def show
    @stock = @client.quote(params[:id].to_s)
    @brokers = User.where(type: 'Broker')
    @buyer_stock = BuyerStock.new
  end

  # for broker
  def create
    @quote = @client.quote(params[:id].to_s)
    @portfolio = Stock.create(name: @quote.company_name.to_s, symbol: @quote.symbol.to_s, current_price: @quote.latest_price, user_id: current_broker.id)

    redirect_to root_path if @portfolio.save
  end

  # for buyer
  def add_stock
    # @buyer_stock = BuyerStock.new(quantity: 100, price: 100, user_id: current_buyer.id, stockSymbol: params[:stock_symbol].to_s, broker_email: params[:broker_email].to_s)

    @buyer_stock = BuyerStock.new(user_id: current_buyer.id, price: params[:price], quantity: params[:quantity], broker_email: params[:broker_email].to_s, stockSymbol: params[:stock_symbol].to_s)

    if @buyer_stock.save
      redirect_to root_path, notice: 'stock was successfully added'
    else
      redirect_to stocks_path, notice: 'It is not fucking working'
    end
  end

  def destroy
    if current_broker
      @stock = Stock.find(params[:id])
      if @stock.destroy
        redirect_to root_path, notice: 'has been removed'
      else
        redirect_to portfolio_home_index_path
      end
    else
      @stock = BuyerStock.find(params[:id])
      if @stock.destroy
        redirect_to root_path, notice: 'has been removed'
      else
        redirect_to portfolio_home_index_path
      end
    end
  end

  private

  def fetch_api
    @client = IEX::Api::Client.new(
      publishable_token: ENV['PUBLIC'],
      secret_token: ENV['SECRET'],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
  end
end
