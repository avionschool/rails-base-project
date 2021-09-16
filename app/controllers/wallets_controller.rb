class WalletsController < ApplicationController
  before_action :setup, only: [:show]

  def index
  end

  def deposit
    @deposit = Wallet.new
  end
  
  def withdraw
    @withdraw = Wallet.new
  end

  def create
    @wallet = Wallet.new(tweet_params)
    @wallet.user = current_user
    if @wallet.save
      flash[:notice] = "Your transaction has been posted to your account."
      redirect_to @wallet
    else
      flash[:alert] = "Invalid inputs. Please check form."
      render :new
    end
  end

  private

  def setup
    @wallet = Wallet.find(params[:id])
  end

  def wallet_params
    params.require(:wallet).permit(:deposit, :withdrawals)
  end
end
