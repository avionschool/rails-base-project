class UsersController < ApplicationController
  def index
    @wallet = current_user.wallet
  end

  def show; end
end
