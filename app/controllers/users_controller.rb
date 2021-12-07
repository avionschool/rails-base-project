class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'New user successfully created'
    else
      render :new, error: 'Failed to create user'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User details successfully updated'
    else
      render :edit, error: 'Failed to update user details'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User data was deleted'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :fullname, :email, :type)
  end
end
