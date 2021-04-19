class HomeController < ApplicationController

    def index
      @client = IEX::Api::Client.new()
      ticker = params[:ticker_input]
  
      if not ticker.nil? and ticker.strip.empty?
        @nothing = "No `Ticker` entered. Please try again."

      elsif ticker

        if ticker.match(/\s/)
          @nothing = "Ticker symbol shoud not contain spaces."
        else
          @quote = @client.quote(ticker)
          if !@quote
            @error = "Stock symbol does not exist."
          end
        end
      end
  
      rescue IEX::Errors::SymbolNotFoundError => e
        @error = "Stock symbol does not exist."
  
    end
  
    def about
    end
    
  end
  