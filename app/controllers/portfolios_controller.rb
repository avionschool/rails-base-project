class PortfoliosController < ApplicationController
  def new
    @users = User.all
    @markets = Market.all
    @portfolios = Portfolio.all
  end
end
