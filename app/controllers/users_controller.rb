class UsersController < ApplicationController
  before_action :set_user
  def index
    @users = User.all
  end

  def show; end

  def update
    @user = User.update(user_params)
  end

  def edit; end

  def get_unconfirmed
    @users = User.unconfirmed
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
