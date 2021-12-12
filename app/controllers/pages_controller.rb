class PagesController < ApplicationController
  def index
    
  end

  def home
    if params[:search_bar] == ""
      @blankSearch = "Please enter stock abbrv"
    elsif params[:search_bar]
      StockQuote::Stock.new(api_key: Rails.application.credentials.config[:stocks_api_key] )
      @stock = StockQuote::Stock.quote(params[:search_bar])
      # if user entered random codes, UNDER CONSTRUCTION
      if !@stock
        @stockErr = "This stock doesnt exist"
      end

    end
   
  end
  
  private

end