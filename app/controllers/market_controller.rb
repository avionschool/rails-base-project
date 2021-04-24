class MarketController < ApplicationController
    before_action :authenticate_user!
    # before_action :market_params, only: [:add_stock_to_market]

    def index
        @markets = current_user.markets.all
        redirect_to(market_url, notice: "Not Authorized User") if @markets.nil?
    end

    # POST
    def show_stock_in_modal
      market = Market.find(params[:market_id])
      @client = IEX::Api::Client.new()
      @market_quote = @client.quote(market.name)

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
          redirect_to(market_url, alert: @nothing) and return
        elsif ticker
  
          if ticker.match(/\s/)
            @nothing = "Ticker symbol shoud not contain spaces."
            redirect_to(market_url, alert: @nothing) and return
          else
            @quote = @client.quote(ticker)
            if !@quote
              @error = "Stock symbol does not exist."
              redirect_to(market_url, alert: @error) and return
            end
          end
        end
    
        rescue IEX::Errors::SymbolNotFoundError => e
          @error = "Stock symbol does not exist."
          redirect_to(market_url, alert: @error) and return

        respond_to  do |format|
            format.js
        end
    end

    # POST
    def add_stock_to_market
      result_exist = current_user.markets.where(name: params[:name]).count

      if result_exist > 0
        redirect_to(market_url, alert: "Stock was already added in Watchlist.") and return 
      else
        # puts current_user.id
        @market = Market.new({name: params[:name], user_id: current_user.id})

        respond_to do |format|
            if @market.save
              redirect_to(market_url, notice: "Stock in Market was successfully added.") and return
            else
              redirect_to(market_url, alert: :unprocessable_entity) and return 
            end
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
