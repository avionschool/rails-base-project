class UsersController < ApplicationController
  def index
    @wallet = current_user.wallet
    @portfolios = current_user.portfolios
  end

  def show; end
end
