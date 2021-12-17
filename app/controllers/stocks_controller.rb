class StocksController < ApplicationController

  # GET /stocks or /stocks.json
  def index
    @stocks = Stock.all
  end

  private

end
