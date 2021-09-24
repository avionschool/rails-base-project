class DashboardController < ApplicationController
  before_action :user_signed_in?
  before_action :current_user_not_approved
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

  def current_user_not_approved
    return unless current_user.status != 'Approved'
    
  end
end
