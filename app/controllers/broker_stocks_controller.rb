class BrokerStocksController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_broker!, except: %i[index show]
  def index
    if broker_signed_in?
      @broker_stocks = current_broker.broker_stocks.all
    elsif buyer_signed_in?
      @available_stocks = BrokerStock.all
    end
  end

  def new
    @stocks = Stock.all
    @broker_stock = current_broker.broker_stocks.build
  end

  def show
    @broker_stock = BrokerStock.find(params[:id])

    @client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.dig(:iex_cloud, :api_key),
      secret_token: Rails.application.credentials.dig(:iex_cloud, :secret_key),
      endpoint: 'https://cloud.iexapis.com/v1'
    )
  end

  def create
    @broker_stock = current_broker.broker_stocks.build(broker_stock_params)

    if @broker_stock.save
      redirect_to broker_stocks_path, notice: 'Successfully add stocks'

    else
      redirect_to :new, alert: @broker_stocks.errors.full_messages
    end
  end

  private

  def broker_stock_params
    params.require(:broker_stock).permit(:symbol, :company_name)
  end
end
