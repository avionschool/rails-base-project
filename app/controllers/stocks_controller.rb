class StocksController < ApplicationController
  def index
    @stocks = Stock.all
    @q = Stock.ransack(params[:q])
    @stock_q = @q.result(distinct: true)
  end

  def show
    @stock = Stock.find(params[:id])
  end
end
