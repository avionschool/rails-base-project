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
  # Brokers and Buyers Only
  def portfolio
    if @user_type == 'broker'
      @portfolio = current_user.stocks
    elsif @user_type == 'buyer'
      @portfolio = curent_user.buyer_stocks
    end
  end
end
