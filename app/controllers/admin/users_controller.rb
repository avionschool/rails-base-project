class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[update approve]
  before_action :authenticate_user!, :require_admin

  def index
    @users = User.all
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'You have successfully update the user'
      redirect_to admin_user_path
    else
      render :edit
    end
  end

  def approve
    @user.approved!
    UserMailer.confirmation_email(@user).deliver_later
    redirect_to admin_users_path
  end

  private

  def require_admin
    return if current_user.admin?

    flash[:alert] = 'You are not authorized to perform that action'
    redirect_to root_path
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, role_ids: [])
  end
end
