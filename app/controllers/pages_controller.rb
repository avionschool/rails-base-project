class PagesController < ApplicationController
  def index
    
  end

  def home
    if params[:ticker]
        @stock = StockQuote::Stock.quote(params[:ticker], @api)
    end
   
  end
  
  private

  def set_api
     # eto yung API key natin, if hindi gumagana, hanap ako loop hole
     @api = StockQuote::Stock.new(api_key: 'pk_51093d06fb6d485ca164a3e61aa5324a')
  end
end