class StocksController < ApplicationController
  def index
    # @stocks = Stock.all
    @q = Stock.ransack(params[:q])
    @length = ((@q.result.length)/10.0).ceil
    @stock_q = @q.result(distinct: true).limit(10)
    # @stock_q = params[:page] ?  @q.result(distinct: true).offset((params[:page].to_i - 1) * 10).limit(10) : @q.result(distinct: true).limit(10)
  end

  def show
    @stock = Stock.find(params[:id])
  end
end
