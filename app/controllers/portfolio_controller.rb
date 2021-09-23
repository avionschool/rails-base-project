class PortfolioController < ApplicationController
  before_action :user_signed_in?
  before_action :setup_portfolio
  
  def index
    @fulfilled_orders = BuyOrder.where(status:1, user: current_user)
  end

  def transactions
    fulfilled_bids = BuyOrder.where(status: 1, user: current_user)
    fullfilled_sells = SellOrder.where(status: 1, user: current_user)
    @fullfilled_transactions = fulfilled_bids.union(fullfilled_sells)
  end

  def pending_orders
    pending_bids = BuyOrder.where(status: 0, user: current_user)
    pending_sells = SellOrder.where(status: 0, user: current_user)
    @pending_orders = pending_bids.union(pending_sells)
  end

  private

  def setup_portfolio
    @gainers = @client.stock_market_list(:gainers)
    @losers = @client.stock_market_list(:losers)
  end
end
