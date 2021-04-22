class MarketController < ApplicationController
    before_action :authenticate_user!
    # before_action :market_params, only: [:add_stock_to_market]

    def index
        # SELECT "stocks".* FROM "stocks" INNER JOIN "users" ON "users"."id" = "stocks"."user_id" INNER JOIN "roles" ON "roles"."id" = "users"."role_id" WHERE (role_name = 'broker') LIMIT $1 
        # @markets = Market.joins(user: :role).where("role_name = 'broker'").limit(10)
        @markets = current_user.markets.all
        redirect_to market_path, notice: "Not Authorized User" if @markets.nil?
    end

    # POST
    def show_stock_in_modal
      puts ""
      puts "show_stock_in_modal : " + params[:market_id]
      puts ""
      market = Market.find(params[:market_id])
      @client = IEX::Api::Client.new()
      @market_quote = @client.quote(market.name)

      puts ""
      puts @market_quote
      puts ""

      respond_to  do |format|
        format.js
      end
    end

    # POST
    def search_stock_in_market
        
        
        ticker = params[:ticker_input]
       
        @client = IEX::Api::Client.new()
    
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
        

        puts @quote

        respond_to  do |format|
            # format.html { redirect_to market_path, notice: "success." }
            format.js
        end
    end

    # POST
    def add_stock_to_market
      # puts current_user.id
      @market = Market.new({name: params[:name], user_id: current_user.id})

      respond_to do |format|
          if @market.save
            redirect_to(market_path, notice: "Stock in Market was successfully added.") and return
            # redirect_to market_path, notice: "Stock was successfully created."
            #   format.json { render :show, status: :created, location: @stock }
          else
            
            redirect_to(market_path, alert: :unprocessable_entity) and return 
            # format.html { render :new, status: :unprocessable_entity }
            # format.json { render json: @stock.errors, status: :unprocessable_entity }
          end
      end
    end
    
    def delete_stock_from_market
      @market = Market.find(params[:id])
      @market.destroy

      respond_to do |format|
        format.html { redirect_to market_url, notice: "Stock in Market was successfully deleted." }
        format.json { head :no_content }
      end
    end

    private

    def market_params
        params.require(:market).permit(:name, :user_id)
    end
end
