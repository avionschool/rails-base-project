class PagesController < ApplicationController
  def index
    
  end

  def home
    if params[:ticker] == ""
      @blankSearch = "Please enter stock abbrv"
    elsif params[:ticker]
      StockQuote::Stock.new(api_key: Rails.application.credentials.config[:stocks_api_key] )
      @stock = StockQuote::Stock.quote(params[:ticker])
      # if user entered random codes, UNDER CONSTRUCTION
      if !@stock
        @stockErr = "This stock doesnt exist"
      end

    end
   
  end
  
  private

end