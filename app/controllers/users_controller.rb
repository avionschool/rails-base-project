class UsersController < ApplicationController
  before_action :set_traders, only: %i[show]

  def index
    @wallet = current_user.wallet
    @portfolios = current_user.portfolios
  end

  def show; end

  private

  def set_traders
    @user = current_user.find(params[:id])
  end

  def traders_params
    params.require(:user).permit(:email)
  end
end
