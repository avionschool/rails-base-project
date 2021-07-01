class PagesController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_user!, except: [:home]

  def home
    @name = current_user.first_name if current_user
  end

  # Brokers and Buyers Only
  def portfolio
    case @user_type
    when 'broker'
      @portfolio = current_user.stocks.all
    when 'buyer'
      @portfolio = current_user.transactions.all
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_type_id, :verified)
  end
end
