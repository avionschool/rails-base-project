class UsersController < ApplicationController
  before_action :set_traders, only: %i[show]

  def index
    @wallet = current_user.wallet
    @portfolios = current_user.portfolios
    @profit_and_loss = 0
    current_market_price = 0
    portfolio_sum = 0

    if @portfolios.length.positive?
      @portfolios.each do |p|
        market = Market.find_by(name: p.market_symbol)
        current_market_price += (market.current_price * p.units).round(2)
        portfolio_sum += (p.hist_price * p.units).round(2)
      end
    end
    @profit_and_loss = (current_market_price - portfolio_sum).round(2)
  end

  def show; end

  private

  def set_traders
    @user = current_user.find(params[:id])
  end

  def traders_params
    params.require(:user).permit(:email)
  end
end
