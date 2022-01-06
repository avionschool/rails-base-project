class CryptocurrenciesController < ApplicationController
  def index
    @cryptos = Cryptocurrency.all
  end

  def show
    @crypto = Cryptocurrency.find(params[:id])
    @crypto_owned = Wallet.where(user_id: 3, cryptocurrency: @crypto.symbol).sum(:balance)
  end
end
