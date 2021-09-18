class UsersController < ApplicationController
  def market
    @tracked_stocks = current_user.stocks
  end
end
