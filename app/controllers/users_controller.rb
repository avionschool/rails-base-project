class UsersController < ApplicationController
  def market
    @tracked_stocks = current_user.stocks
    @buy_orders = BuyOrder.all
    @sell_orders = SellOrder.all
  end
end
