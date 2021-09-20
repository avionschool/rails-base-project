class UsersController < ApplicationController
  def index
    @users = User.all
    @markets = Market.all
    @portfolios = Portfolio.all
  end
end
