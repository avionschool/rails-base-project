class StocksController < ApplicationController

  # GET /stocks or /stocks.json
  def index
    @stocks = Stock.all
    @holdings = Holding.all
    @user_id = params[:user_id]
    @holdings = Holding.find_by(id: params[:user_id])
  end

  def show
    # @stock = Stock.render_news('AAPL')
    # if !@stock
    #   flash[:alert] = "Stock information not available"
    # end
  end
  private

  def holding_params 
  end

end
