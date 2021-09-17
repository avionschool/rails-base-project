class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end

  # private

  # def stock_params
  #   params.require(:stock).permit(:code, :name, :current_price)
  # end
end
