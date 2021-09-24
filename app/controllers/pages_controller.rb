class PagesController < ApplicationController
  def landing
    redirect_to home_path and return if user_signed_in? || admin_signed_in?
  end

  def home
    @stocks = Stock.all
    @home ||= IEX::Api::Client.new.stock_market_list(:mostactive)
  end

  def portfolio
    @portfolio = current_user.user_stocks
  end

  def transactions
    @transactions = current_user.trades.order('created_at DESC').page params[:page]
  end
end
