class AdminPortalsController < ApplicationController
  def index
    @users = User.all
    @trades = Trade.all
  end

  def show_user
    @user = User.find(params[:id])
  end

  def approve_user
    @user = User.all
    @user = User.find_by(id: params[:id])
    @user.update(status: 'approved')
    return unless @user.save

    CreateUserWallet.call(@user)
    redirect_to admins_home_path
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:username, :first_name, :last_name, :email))
    redirect_to admins_home_path if @user.update(params.require(:user).permit(:username, :first_name, :last_name, :email))
  end

  def add_user; end

  def create_user
    @user = User.new(params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation))
    if @user.save && @user.update(status: 'approved')
      CreateUserWallet.call(@user)
      redirect_to admins_home_path
    else
      flash[:error] = @user.errors.full_messages.first
      redirect_to admins_add_user_path
    end
  end

  def show_pending_users
    @users = User.where(status: 'pending')
  end

  def show_registered_users
    @users = User.all
  end
end
