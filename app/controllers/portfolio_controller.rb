class PortfolioController < ApplicationController
  before_action :user_signed_in?
  before_action :setup_portfolio
  
  def index 
  end

  def transactions
  end

  def pending_orders
  end

  private

  def setup_portfolio
    @gainers = @client.stock_market_list(:gainers)
    @losers = @client.stock_market_list(:losers)
  end
end
