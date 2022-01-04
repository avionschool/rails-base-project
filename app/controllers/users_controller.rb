class UsersController < ApplicationController
  def index
    if user_signed_in?
      if current_user.wallet
        @balance = current_user.wallet.balance
      else
        @balance = '0.00'
      end
    end
    @holdings = current_user.stock_holding.order('stock_symbol ASC')
  end

  def show
    # @user = User.find(params[:id])
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to admin_root_path, notice: "A user data was successfully destroyed"
  # end
end
