require 'httparty'

class TradesController < ApplicationController
  def index
    @response = HTTParty.get('https://api.coingecko.com/api/v3/exchanges/binance')
  end

  def show
    @coin = "BTCUSDT"
  end
end
