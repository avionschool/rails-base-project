class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[update approval]
  before_action :authenticate_user!, :require_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def approval
    @user = User.find(params[:id])
    @user.update(:status, 'Approved')
    UserMailer.with(user: @user).new_trader_approved.deliver_later
    redirect_to pending_users_path
  end

  def pending_users
    @users = User.where(status: 0).order('created_at ASC')
  end

  def approve_users
    @users = User.where(status: 1).order('created_at ASC')
  end

  def new
    @user = User.new
  end

  def update
    if @user.update(user_params)
      @user.update(:status, 'Approved')
      UserMailer.with(user: @user).new_trader_approved.deliver_later
      flash[:notice] = 'You have successfully update the user'
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    UserMailer.with(user: @user).new_trader_approved.deliver_later
    flash[:success] = 'The user was successfully destroyed.'
    redirect_to admin_users_path
  end

  private

  def require_admin
    return if current_user.admin?

    flash[:alert] = 'You are not authorized to perform that action'
    redirect_to root_path
  end

  def user_params
    params.permit(:user)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
