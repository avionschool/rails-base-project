class StocksController < ApplicationController
  def index
    @stocks = Stock.order(:code).page params[:page]
    UpdateStocksPrice.execute(@stocks)
  end

  # private

  # def stock_params
  #   params.require(:stock).permit(:code, :name, :current_price)
  # end
end
