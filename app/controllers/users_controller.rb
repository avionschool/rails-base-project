class UsersController < ApplicationController
  def market
    @tracked_stocks = current_user.stocks
    @gainers = @client.stock_market_list(:gainers)
    @losers = @client.stock_market_list(:losers)
    @balance = current_user.wallets.total_balance
  end
end
