class StocksController < ApplicationController
  def index
    @stocks = Stock.paginate(page: params[:page], per_page: 10)
  end

  def search; end
end
