class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @wallet = current_user.wallet
  end

  def show; end
end
