class AdminPortalsController < ApplicationController
  def index
    @users = User.all
  end

  def show_user
    @user = User.find(params[:id])
  end

  def approve_user
    @user = User.all
    @user = User.find_by(id: params[:id])
    return unless @user.update(status: 'approved')

    CreateUserWallet.call(@user)

    redirect_to admins_home_path
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])
    redirect_to admins_home_path if @user.update(update_user_params)
  end

  private

  def update_user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
