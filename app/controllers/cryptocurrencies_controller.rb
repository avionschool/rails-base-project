class CryptocurrenciesController < ApplicationController
  def index
    @cryptos = Cryptocurrency.all
  end

  def show
    @crypto = Cryptocurrency.find(params[:id])
  end
end
