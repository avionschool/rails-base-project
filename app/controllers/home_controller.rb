class HomeController < ApplicationController

    def index
      if user_signed_in?
        redirect_to market_path
      end
    end
  
    def about
    end
    
  end
  