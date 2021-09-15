class DashboardController < ApplicationController
  def index
    @deposits = current_user.wallets.total_deposits
    @withdrawals = current_user.wallets.total_withdrawals
    @balance = current_user.wallets.total_balance
  end
end
