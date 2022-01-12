class BuyerController < ApplicationController
  before_action :authenticate_buyer!

  def index
    # @globalNews = News::Client.global
    # @exchangeNews = News::Client.exchange
  end
end
