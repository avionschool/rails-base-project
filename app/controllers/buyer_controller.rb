class BuyerController < ApplicationController
  before_action :authenticate_buyer!

  def index
    @all_stocks = Stock.all
    # @globalNews = News::Client.global
    # @exchangeNews = News::Client.exchange
  end

  def portfolio
    @bought_stocks = current_buyer.stock
end
