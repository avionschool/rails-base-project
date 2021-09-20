class UsersController < ApplicationController
  def index
    @sample_stocks = SampleStock.all
    @users = User.all
    @portfolios = Portfolio.all
  end

  # delete this once market view has been created
  # def market_index; end
end
