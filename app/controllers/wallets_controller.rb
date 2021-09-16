class WalletsController < ApplicationController
  before_action :setup, only: [:show]

  def index; end

  def deposit
    @deposit = Wallet.new
    @balance = current_user.wallets.total_balance
  end
  
  def withdraw
    @withdraw = Wallet.new
    @balance = current_user.wallets.total_balance
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

  def setup
    @wallet = Wallet.find(params[:id])
  end

  def wallet_params
    params.require(:wallet).permit(:deposit, :withdrawals)
  end
end
