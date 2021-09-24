class PagesController < ApplicationController
  def landing
    @stocks = Stock.all
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
