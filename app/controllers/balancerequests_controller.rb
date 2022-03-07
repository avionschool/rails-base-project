class BalancerequestsController < ApplicationController
  before_action :authenticate_trader!
  def index; end

  def new
    @balancereq = BalanceRequest.new
  end

  def create
    @balancereq = current_trader.BalanceRequests.build(balance_request_params)

    if @balancereq.save
      redirect_to trader_portfolio_path, notice: 'request successfully created!'
    else
      render :new
    end
  end

  private

  def balance_request_params
    params.require(:balance_request).permit(:amount)
  end
end
