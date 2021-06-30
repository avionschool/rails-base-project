class StocksController < ApplicationController
  def index
    @stocks = if current_user.broker?
                Stock.paginate(page: params[:page], per_page: 10).order(:id)
              else
                UserStock.brokerstocks.paginate(page: params[:page], per_page: 10)
              end
  end

  def show
    @stock = Stock.find(params[:id])
    client_sb = Stock.sandbox_api
    client = Stock.iex_api
    @stock.update(logo: client.logo(@stock.ticker).url) unless @stock.logo
    @stock_quote = client_sb.quote(@stock.ticker)
    @stock.update(description: client.company(@stock.ticker).description) unless @stock.description
    @stock.update(last_price: @stock_quote.latest_price)
    @stock_key_stats = client_sb.key_stats(@stock.ticker)
    @broker_stocks = @stock&.user_stocks&.brokerstocks
  end

  def search; end
end
