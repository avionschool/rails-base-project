class DashboardController < ApplicationController
  before_action :user_signed_in?
  before_action :setup_portfolio, only: [:index]

  def index
    @deposits = current_user.wallets.total_deposits
    @withdrawals = current_user.wallets.total_withdrawals
    @balance = current_user.wallets.total_balance
    @gainers = @client.stock_market_list(:gainers)
    @losers = @client.stock_market_list(:losers)
    @fulfilled_orders = BuyOrder.where(status: 1, user: current_user)
    @admin = current_user.admin?
  end

  private

  def setup_portfolio
    @portfolio = []
    trades = Trade.all
    trades.each do |t|
      if t.buyer == current_user.email && t.seller.nil? && t.buy_order.fulfilled?
        @portfolio.push(t)
      end
    end
  end
end
