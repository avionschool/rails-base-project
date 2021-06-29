class StocksController < ApplicationController
  def index
    @stocks = if current_user.broker?
                Stock.paginate(page: params[:page], per_page: 10)
              else
                UserStock.brokerstocks.paginate(page: params[:page], per_page: 10)
              end
  end

  def search; end
end
