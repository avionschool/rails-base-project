class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  def index
    @users = User.all
  end

  def show; end

  def update
    @user = User.update(user_params)
  end

  def edit; end

  def unconfirmed
    @users = User.unconfirmed
  end

  def destroy; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
