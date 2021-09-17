class DashboardController < ApplicationController
  before_action :setup

  def index
    @deposits = current_user.wallets.total_deposits
    @withdrawals = current_user.wallets.total_withdrawals
    @balance = current_user.wallets.total_balance
    @gainers = @client.stock_market_list(:mostactive)
  end

  private

  def setup
    @client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
                                  endpoint: 'https://sandbox.iexapis.com/v1')
  end
end
