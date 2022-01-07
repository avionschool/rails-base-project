class UsersController < ApplicationController
  def new 
    @user = User.new
  end

  def index
    @user = User.all
    @stocks = Stock.all
    @holdings = current_user.holdings
    @wallets = Wallet.all
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      flash[:notice] = "User Created"
      redirect_to root_path
    else
      render :new
    end
  end

  def show 
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password_digest, :email, :username)
  end

end