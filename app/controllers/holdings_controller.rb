class HoldingsController < ApplicationController
    before_action :authenticate_user!

    def new
        @users = User.all
        @stocks = Stock.all
        @stocks = Stock.find(params[:stock_id])
        @wallets = Wallet.all
        @holding = Holding.new
        @holding = current_user.holdings.build
        @holdings = Holding.all
        @holdings = Holding.find_by(id: params[:user_id])
        @holdings = Holding.find_by(id: params[:stock_id])
        @buy_value = @stocks.current_price * 50 + (@stocks.current_price*50*0.1)
        @sell_value = @stocks.current_price * 50 - (@stocks.current_price*50*0.1)

    end

    def create 
        @holding = current_user.holdings.build(holding_params)
        if @holding.save
            redirect_to users_path
        else
            render :new
        end
    end

    private

    def holding_params
        params.require(:holding).permit(:user_id, :ticker, :log_price, :amount, :stock_id, :transaction_type)
    end
end
