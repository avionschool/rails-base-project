class MarketController < ApplicationController
    before_action :authenticate_user!

    def index
        # SELECT "stocks".* FROM "stocks" INNER JOIN "users" ON "users"."id" = "stocks"."user_id" INNER JOIN "roles" ON "roles"."id" = "users"."role_id" WHERE (role_name = 'broker') LIMIT $1 
        @markets = Market.joins(user: :role).where("role_name = 'broker'").limit(10)
        
       
    end

    def search_stock_in_market
        @client = IEX::Api::Client.new()
        ticker = params[:ticker_input]
    
        if not ticker.nil? and ticker.strip.empty?
          @nothing = "No `Ticker` entered. Please try again."
          redirect_to(market_path, alert: @nothing) and return
        elsif ticker
  
          if ticker.match(/\s/)
            @nothing = "Ticker symbol shoud not contain spaces."
            redirect_to(market_path, alert: @nothing) and return
          else
            @quote = @client.quote(ticker)
            if !@quote
              @error = "Stock symbol does not exist."
              redirect_to(market_path, alert: @error) and return
            end
          end
        end
    
        rescue IEX::Errors::SymbolNotFoundError => e
          @error = "Stock symbol does not exist."
          redirect_to(market_path, alert: @error) and return
        
        respond_to  do |format|
            # format.html { redirect_to market_path, notice: "success." }
            format.js
        end
    end

    def add_stock_to_market
        market = Market.new(market_params)

        respond_to do |format|
            if market.save
              redirect_to market_path, notice: "Stock was successfully created."
              #   format.json { render :show, status: :created, location: @stock }
            else
              redirect_to market_path, alert: :unprocessable_entity 
              # format.html { render :new, status: :unprocessable_entity }
              # format.json { render json: @stock.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def market_params
        params.require(:market).permit(:name, :user_id)
    end
end
