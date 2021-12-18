class StocksController < ApplicationController

  # GET /stocks or /stocks.json
  def index
    @stocks = Stock.all
  end

  def show
    # @stock = Stock.render_news('AAPL')
    # if !@stock
    #   flash[:alert] = "Stock information not available"
    # end
  end
  private

end
