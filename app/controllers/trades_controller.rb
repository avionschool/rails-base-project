require 'httparty'

class TradesController < ApplicationController
  def index
    @response = HTTParty.get('https://api.coingecko.com/api/v3/exchanges/binance')
    @coins = Coin.all
  end

  def show
    # @coin = Coin.find_by(base: params[:base], target: params[:target])
    @coins = Coin.all
    @coin = Coin.find_by(base: params[:base])
    @cp_str= "#{@coin.base}#{@coin.target}"
    if current_user
      @wallet = current_user.wallet
      @order = @coin.orders.build
      @portfolio = @wallet.portfolios.where(symbol: params[:base]).first
    end
  end
  
  def create
    # @coin = Coin.find(params[:coin_id])
    # @order = @coin.orders.build(order_params)
    # @order.wallet = current_user.wallet

    # if @order.save
    #   redirect_to @coin
    # else
    #   render :show
    # end
  end


  private 
  
  def order_params
    params.require(:order).permit(:price, :quantity, :kind).merge(wallet_id: current_wallet.id)
  end
end
