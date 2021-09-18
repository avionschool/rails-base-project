class WalletsController < ApplicationController
  before_action :setup_wallet, only: [:show]
  before_action :wallet_config, only: %i[deposit withdraw]

  def index; end

  def deposit
    @gainers = @client.stock_market_list(:gainers)
    @losers = @client.stock_market_list(:losers)
  end

  def withdraw
    @gainers = @client.stock_market_list(:gainers)
    @losers = @client.stock_market_list(:losers)
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user = current_user
    if @wallet.save
      flash[:notice] = 'Your transaction has been posted to your account.'
      redirect_to dashboard_path
    else
      flash[:alert] = 'Invalid inputs. Please check form.'
      render :new
    end
  end

  def show; end

  private

  def setup_wallet
    @wallet = Wallet.find(params[:id])
  end

  def wallet_config
    @deposit = Wallet.new
    @withdraw = Wallet.new
    @balance = current_user.wallets.total_balance
  end

  def wallet_params
    params.require(:wallet).permit(:deposit, :withdrawals)
  end
end
