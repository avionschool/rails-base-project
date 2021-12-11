class PagesController < ApplicationController
  def index
    
  end

  def home
    if params[:search_bar] == ""
      @blankSearch = "Please enter stock abbrv"
    elsif params[:search_bar]
      StockQuote::Stock.new(api_key: 'pk_51093d06fb6d485ca164a3e61aa5324a')
      @stock = StockQuote::Stock.quote(params[:search_bar])
      # if user entered random codes, UNDER CONSTRUCTION
      if !@stock
        @stockErr = "This stock doesnt exist"
      end

    end
   
  end
  
  private

  def set_api
     # eto yung API key natin, if hindi gumagana, hanap ako loop hole
     @api = StockQuote::Stock.new(api_key: 'pk_51093d06fb6d485ca164a3e61aa5324a')
  end
end