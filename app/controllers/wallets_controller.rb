class WalletsController < ApplicationController
  def index
    @cryptos = Cryptocurrency.all
    @owned = Wallet.where(user_id: 3).distinct.pluck(:cryptocurrency)
  end

  def show
    @crypto = Cryptocurrency.find(params[:id])
  end

  def new
    @crypto = Cryptocurrency.find(params[:id])
    @crypto_owned = Wallet.where(user_id: 3, cryptocurrency: @crypto.symbol).sum(:balance)
  end
end
