class BrokerStocksController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_broker!, except: :index

  def index
    @broker_stocks = current_broker.broker_stocks.all
    @available_stocks = BrokerStock.all
  end

  def new
    @stocks = Stock.all
    @broker_stock = current_broker.broker_stocks.build
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
