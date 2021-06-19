class StocksController < ApplicationController
  before_action :fetch_api, only: %i[index show create]
  def index; end

  def show
    @stock = @client.quote(params[:id].to_s)
    @brokers = User.where(type: 'Broker')
    @buyer_stock = BuyerStock.new
  end

  def create
    @quote = @client.quote(params[:id].to_s)
    @portfolio = Stock.create(name: @quote.company_name.to_s, symbol: @quote.symbol.to_s, current_price: @quote.latest_price, user_id: current_broker.id)

    redirect_to root_path if @portfolio.save
  end

  def add_stock
    @buyer_stock = BuyerStock.new(user_id: current_buyer.id, price: params[:price], quantity: params[:quantity], broker_email: params[:broker_email].to_s, stockSymbol: params[:stock_symbol].to_s)
    if @buyer_stock.save
      @transaction = PurchaseTransaction.new(
        stock_code: params[:stock_symbol],
        company_name: params[:company_name],
        price: params[:price],
        volume: params[:quantity],
        total_value: params[:price].to_i * params[:quantity].to_i,
        user_id: current_buyer.id,
        broker_id: params[:broker_id],
        stock_id: params[:stock_id],
        broker_name: params[:broker_email]
      )
      @transaction.save
      redirect_to root_path, notice: 'stock was successfully added'
    else
      redirect_to stocks_path, notice: 'It is not fucking working'
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    if @stock.destroy
      redirect_to root_path, notice: 'has been removed'
    else
      redirect_to portfolio_home_index_path
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
