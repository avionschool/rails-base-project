class TradersController < ApplicationController
  before_action :authenticate_trader!

  def index
    @trader = Wallet.find_by(trader_id: current_trader.id)
  end

  def show; end
end
