class StockHoldingsController < ApplicationController
  include ApplicationHelper
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error
  before_action :authenticate_user!

  def new
    @stock = Stock.find(params[:stock_id])
    @balance = current_user.wallet.balance if current_user.wallet
    @holding = current_user.stock_holding.build
    # Buy and value from ApplicationHelper
    @buy = stock_value_buy(@stock.current_price)
    @sell = stock_value_sell(@stock.current_price)
    # If the user own a stock or not(will show the units owned)
    @current_stock = current_user.stock_holding.find_by(stock_symbol: @stock.stock_symbol)
  end

  def create
    # Finding stocks if user has it or not
    stock_avail = current_user.stock_holding.find_by(stock_symbol: params[:stock_holding][:stock_symbol])
    @user_wallet = current_user.wallet
    case params[:stock_holding][:t_type]
    when 'BUY'
      buy_logic(stock_avail)
    when 'SELL'
      sell_logic(stock_avail)
    end
  end

  private

  def holding_params
    params.require(:stock_holding).permit(:user_id, :stock_symbol, :stock_price, :units, :amount, :stock_id, :t_type)
  end

  def buy_logic(stock_avail)
    if stock_avail.nil?
      @holding = current_user.stock_holding.build(holding_params)
      # units = amount bought(you typed) divided by stock price
      @holding.units = @holding.amount / @holding.stock_price
      # deducting the user's balance from the amount you bought
      @user_wallet.balance = current_user.wallet.balance - @holding.amount
      # only save if you have more than 0 balance
      @holding.save if @user_wallet.balance.positive?
      # for saving user's balance
      if @user_wallet.balance.positive? && @holding.save
        @user_wallet.save
        flash[:notice] = "You successfully bought the stock"
        redirect_to users_path
      else
        flash[:alert] = "Please double check all payment information and try again."
        redirect_back fallback_location: users_path
      end
    else
      # Update if there's already a stock
      @holding = stock_avail
      amount = params[:stock_holding][:amount].to_f
      stock_price = params[:stock_holding][:stock_price].to_f
      # Units to be added
      units = amount / stock_price
      # Adding the the units the current user currently have
      @holding.units += units
      # Adding to the amount in the stocks you bought
      @holding.amount += params[:stock_holding][:amount].to_f
      @user_wallet.balance = current_user.wallet.balance - params[:stock_holding][:amount].to_f
      # only save if you have more than 0 balance
      @holding.save if @user_wallet.balance.positive?
      # updating user's balance
      if @user_wallet.balance.positive? && @holding.save
        @user_wallet.save
        flash[:notice] = "You successfully bought the stock"
        redirect_to users_path
      else
        flash[:alert] = "Please double check all payment information and try again."
        redirect_back fallback_location: users_path
      end
    end
  end

  def sell_logic(stock_avail)
    # if the user have the current stock in the user's stock holdings
    if stock_avail.nil? || stock_avail.units < params[:stock_holding][:units].to_f
      flash[:alert] = "Please double check if you have enough units and try again."
      redirect_back fallback_location: users_path
    else
      @holding = stock_avail
      # Current holdings units - to the amount of units the user entered/typed
      @holding.units -= params[:stock_holding][:units].to_f
      # if no more units available, remove it from the user's database
      if @holding.units.zero?
        @holding.destroy
      else
        @holding.save
      end
      # Stock units * stock price = stock amount which is added to the user's balance
      @user_wallet.balance = current_user.wallet.balance + params[:stock_holding][:units].to_f * params[:stock_holding][:stock_price].to_f
      @user_wallet.save
      flash[:notice] = "You successfully sold the stock"
      redirect_to users_path
    end
  end
end
