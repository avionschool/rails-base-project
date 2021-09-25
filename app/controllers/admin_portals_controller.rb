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

    flash[:notice] = 'Successfully approved trader registration'
    ApprovedAccountMailer.with(email: @user.email).approve_email.deliver_now
    CreateUserWallet.call(@user)
    redirect_to admins_show_pending_users_path
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:username, :first_name, :last_name, :email))
    flash[:notice] = 'Sucessfully updated trader account'
    redirect_to admins_show_registered_users_path if @user.update(params.require(:user).permit(:username, :first_name, :last_name, :email))
  end

  def add_user; end

  def create_user
    @user = User.new(params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation))
    if @user.save && @user.update(status: 'approved')
      ApprovedAccountMailer.with(email: @user.email).approve_email.deliver_now
      CreateUserWallet.call(@user)
      flash[:notice] = 'Successfully created new trader account'
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
