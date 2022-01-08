class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.wallet
        @balance = current_user.wallet.balance
      else
        @balance = '0.00'
      end
      @holdings = current_user.stock_holding.order('stock_symbol ASC')
      @name = current_user.first_name + ' ' + current_user.last_name   
    else 
      @name = "Stranger"
    end
  end

  def error_page
  end

end
