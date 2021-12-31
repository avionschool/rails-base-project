class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end
end
