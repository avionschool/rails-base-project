class HoldingsController < ApplicationController
    before_action :authenticate_user!

    def new
        @stock = Stock.find(params[:stock_id])
        @holding = current_user.holdings.build
        @wallet = current_user.wallet
        @buy_value = helpers.stock_total_value(true, @stock.current_price)
        @sell_value = helpers.stock_total_value(false, @stock.current_price)
        @current_stock = current_user.holdings.find_by(ticker: @stock.ticker)

    end

    def create 
        currently_holding_stock = current_user.holdings.find_by(ticker: params[:holding][:ticker])
        trade_logic(currently_holding_stock)
    end

    private

    def holding_params
        params.require(:holding).permit(:user_id, :ticker, :log_price, :amount, :stock_id, :transaction_type, :units)
    end

    def convert_to_units(hold, stock_price) 
        hold / stock_price
    end

    def trade_logic(currently_holding_stock)
        @user_wallet = current_user.wallet
        case params[:holding][:transaction_type]
        when 'BUY'
          buy_logic(currently_holding_stock)
        when 'SELL'
          sell_logic(currently_holding_stock)
        end
    end

    def buy_logic(currently_holding_stock) 
        if currently_holding_stock.nil?
            @holding = current_user.holdings.build(holding_params)
            @holding.units = @holding.amount / @holding.log_price
            @user_wallet.balance = current_user.wallet.balance - @holding.amount
            @holding.save if @user_wallet.balance.positive?
            buy_logic_update(@user_wallet, @holding, @holding.units)
          else
            @holding = currently_holding_stock
            amount = params[:holding][:amount].to_f
            stock_price = params[:holding][:log_price].to_f
            units_to_be_added = amount / stock_price
            @holding.units = (@holding.units + units_to_be_added)
            @holding.amount = (@holding.amount + params[:holding][:amount].to_f)
            @user_wallet.balance = current_user.wallet.balance - params[:holding][:amount].to_f
            @holding.save if @user_wallet.balance.positive?
            buy_logic_create(@user_wallet, @holding, units_to_be_added)
        end
    end

    def buy_logic_update(user_wallet, holding, units_to_be_added)
        if user_wallet.balance.positive? && holding.save
          user_wallet.save
          trade_logger_buy(units_to_be_added)
          redirect_to users_path, notice: 'Successfully bought stocks'
        else
          redirect_back fallback_location: users_path, notice: 'Kindly double check all information before submitting.'
        end
    end

    def buy_logic_create(user_wallet, holding, units_to_be_added)
        if user_wallet.balance.positive? && holding.save
          user_wallet.save
          trade_logger_buy(units_to_be_added)
          redirect_to users_path, notice: 'Successfully bought stocks'
        else
          redirect_back fallback_location: users_path, notice: 'Kindly double check all information before submitting. '
        end
    end

    def sell_logic(currently_holding_stock)
        if currently_holding_stock.nil? || currently_holding_stock.units < params[:holding][:units].to_f

          redirect_back fallback_location: users_path, notice: 'Please check if you have enough stock available for this market'
        else
          @holding = currently_holding_stock
          @holding.units = (@holding.units - params[:holding][:units].to_f) 
          @user_wallet.balance = current_user.wallet.balance + (params[:holding][:units].to_f * params[:holding][:log_price].to_f)
          @user_wallet.save
          trade_logger_sell
          @holding.units.zero? ? @holding.destroy : @holding.save
    
          redirect_to users_path, notice: 'Stock successfully sold!'
        end
    end

    def trade_logger_buy(units_to_be_added)
      TradeLog.create(user_id: current_user.id, email: current_user.email, username: current_user.username, transaction_type: params[:holding][:transaction_type], ticker: params[:holding][:ticker], log_stock_price: params[:holding][:log_price].to_f, amount: params[:holding][:amount].to_f, units: units_to_be_added, transaction_date: DateTime.now)
    end

    def trade_logger_sell
      TradeLog.create(user_id: current_user.id, transaction_type: params[:holding][:transaction_type], ticker: params[:holding][:ticker], log_stock_price: params[:holding][:log_price].to_f, amount: (params[:holding][:units].to_f * params[:holding][:log_price].to_f), units: params[:holding][:units].to_f, transaction_date: DateTime.now)
    end
end

