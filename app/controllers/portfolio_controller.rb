class PortfolioController < ApplicationController
  before_action :user_signed_in?
  before_action :setup_gainers_losers
  before_action :setup_portfolio, only: [:index]

  def index; end

  def transactions
    fulfilled_bids = BuyOrder.where(status: 1, user: current_user)
    fullfilled_sells = SellOrder.where(status: 1, user: current_user)
    @fullfilled_transactions = fulfilled_bids.union(fullfilled_sells).order('updated_at DESC')
  end

  def pending_orders
    pending_bids = BuyOrder.where(status: 0, user: current_user)
    pending_sells = SellOrder.where(status: 0, user: current_user)
    @pending_orders = pending_bids.union(pending_sells).order('updated_at DESC')
  end

  private

  def setup_gainers_losers
    @gainers = @client.stock_market_list(:gainers)
    @losers = @client.stock_market_list(:losers)
  end

  def setup_portfolio
    @portfolio = []
    trades = Trade.all
    trades.each do |t|
      @portfolio.push(t) if t.buyer == current_user.email && t.seller != current_user.email && t.buy_order.fulfilled?
    end
  end
end
