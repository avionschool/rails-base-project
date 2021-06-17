class StocksController < ApplicationController
  before_action :fetch_api, only: [ :index, :show, :create ]

  def index
  end

  def show
    @stock = @client.quote("#{params[:id]}")
  end

  def create
    @quote = @client.quote("#{params[:id]}")
    @portfolio = Stock.create(name: "#{@quote.company_name}", symbol: "#{@quote.symbol}", current_price: @quote.latest_price, user_id: current_broker.id)

    if @portfolio.save
      redirect_to root_path
    end
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
      # publishable_token: ENV['PUBLIC'],
      # secret_token: ENV['SECRET'],
      publishable_token: "Tpk_5e637bd957564d788d24f9b9491c1576",
      secret_token: "Tsk_81e8f3dbee154676a9ece271e45ac5e3",
      # publishable_token: "Tpk_145ab4d03ae14ce8af5becf9da085fb3",
      # secret_token: "Tsk_59788dd8ec49474090f3cf193f357a6c",
      endpoint: 'https://sandbox.iexapis.com/v1' # 'https://cloud.iexapis.com/v1'
    )
  end
end
