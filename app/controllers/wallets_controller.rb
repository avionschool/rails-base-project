class WalletsController < ApplicationController
  def index
    @cryptos = Cryptocurrency.all
  end
end
