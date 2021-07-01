class AdminController < ApplicationController
  before_action :user_types, only: %i[new edit]

  def users
    @buyers = User.buyers.all
    @admins = User.admins.all
    @brokers = User.brokers.all
    @users = User.all
  end

  def pending
    @pending = User.brokers.where(verified: false)
  end

  def edit_pending
    @user = User.find(params[:id])
  end

  def approve_pending
    @user = User.find(params[:id])
    redirect_to users_pending_path if @user.update(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_index_path, notice: 'User Successfuly Created'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_index_path, notice: 'User Successfuly Edited'
    else
      render :edit
    end
  end

  private

  def user_types
    @broker = UserType.find_by(user_type: 'broker')
    @buyer = UserType.find_by(user_type: 'buyer')
    @admin = UserType.find_by(user_type: 'admin')
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_type_id, :verified)
  end
end
