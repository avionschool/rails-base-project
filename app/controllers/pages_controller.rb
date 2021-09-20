class PagesController < ApplicationController
  def landing
    @stocks = Stock.all
  end

  def home
    @stocks = Stock.all
  end

  def transactions
    @transactions = current_user.trades.order(:created_at).reverse
  end
end
