require 'httparty'

class TradesController < ApplicationController
  def index
    @response = HTTParty.get('https://api.coingecko.com/api/v3/exchanges/binance')
    @coins = Coin.all
  end

  def show
    @coin = Coin.find_by(base: params[:base], target: params[:target])
    @cp_str= "#{@coin.base}#{@coin.target}"
  end
end
