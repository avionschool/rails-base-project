class PortfoliosController < ApplicationController
  def new
    @users = User.all
    @sample_stocks = SampleStock.all
    @portfolios = Portfolio.all

    #@portfolio = @sample_stocks.portfolios.build
  end

  def create
    @portfolios = @sample_stocks.portfolios.build(portfolio_params)
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:user_id, :market_symbol, :hist_price, :amount, :sample_stock_id)
  end
end
