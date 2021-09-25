class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
    # @deposit = wallet.deposit
    # @withdrawal = Wallet.find_by(params[:user_id]).withdraw
    # @balance = Wallet.user_id.total_balance
  end

  def new
    @wallet = Wallet.new
  end

  def show; end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user_id = 4
    @wallet.created_at = Time.current
    @wallet.updated_at = Time.current
    if @wallet.save
      flash[:notice] = 'Transaction has been added.'
      redirect_to wallets_path
    else
      # flash[:alert] = 'Invalid inputs. Please check again.'
      render :new
    end
  end

  private

  def wallet_params 
    params.require(:wallet).permit(:deposit, :withdraw, :user_id)
    # params.permit(:authenticity_token, :wallet, :commit, :deposit, :withdraw)
  end

  # def setup_wallet
  #   @wallet = Wallet.find(params[:id])
  # end

  # def wallet_config
  #   @deposit = Wallet.new
  #   @withdraw = Wallet.new
  #   @balance = current_user.wallets.total_balance
  # end
end
