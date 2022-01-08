class UsersController < ApplicationController
  def index
    if user_signed_in?
      @holdings = current_user.stock_holding.order('stock_symbol ASC')              
      @name = current_user.first_name + ' ' + current_user.last_name  
      @join_date = current_user.created_at.to_date  

      if current_user.wallet
        @balance = current_user.wallet.balance
      else
        @balance = '0.00'
      end
    end
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
