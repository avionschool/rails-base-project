class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.wallet
        @balance = current_user.wallet.balance
      else
        @balance = '0.00'
      end
    end
  end

  def error_page
  end
end
