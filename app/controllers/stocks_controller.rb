class StocksController < ApplicationController
  before_action :fetch_api, only: %i[index show create]

  def index; end

  def show
    @stock = @client.quote(params[:id].to_s)
  end

  def create
    @quote = @client.quote(params[:id].to_s)
    @portfolio = Stock.create(name: @quote.company_name.to_s, symbol: @quote.symbol.to_s, current_price: @quote.latest_price, user_id: current_broker.id)

    redirect_to root_path if @portfolio.save
  end

  def destroy
    @stock = Stock.find(params[:id])
    if @stock.destroy
      redirect_to root_path
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
