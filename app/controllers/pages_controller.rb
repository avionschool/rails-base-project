class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @name = current_user.first_name
  end

  # Admin Only
  def users
    @buyers = User.buyers.all
    @brokers = User.brokers.where(verified: true)
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

  # Brokers and Buyers Only
  def portfolio
    case @user_type
    when 'broker'
      @portfolio = current_user.stocks
    when 'buyer'
      @portfolio = current_user.buyer_stocks
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_type_id, :verified)
  end
end
