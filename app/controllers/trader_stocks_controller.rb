class TraderStocksController < ApplicationController
  before_action :authenticate_user!, :require_trader

  def stock_market
    @stocks = Stock.paginate(page: params[:page], per_page: 10).order('stock_price DESC')
  end

  def trader_stock
    @stocks = UserStock.where(user_id: current_user.id).paginate(page: params[:page], per_page: 10).order('created_at ASC')
  end

  def search
    if params[:search].present?
      @stock = Stock.new_lookup(params[:search])

      if !@stock
        flash[:alert] = 'Please enter a valid symbol to search.'
      end
    else
      flash[:valid_ticker] = 'Please enter a symbol to search.'
    end
  end

  def buy_stock_new
    @stock = Stock.new_lookup(params[:ticker]) if params[:ticker]
  end

  def buy_stock
    @transaction = Transaction.new(buy_params)
    @transaction.total_price = @transaction.price * @transaction.quantity

    @trader_stock = UserStock.new(stock_params)
    @trader_stock.total_price = @transaction.price * @transaction.quantity

    if current_user.balance > @trader_stock.total_price
      if @transaction.save
        @trader_stock.save
        flash[:notice] = 'Successfully Buy'
        user_balance = current_user.balance - @transaction.total_price
        current_user.update(balance: user_balance)
        redirect_to trader_stock_path
      else
        flash[:alert] = 'Error'
      end
    else
      redirect_to buy_stock_path(@transaction.ticker)
      flash[:alert] = "Not enough balance. Your available balance is $#{current_user.balance}"
    end
  end

  def sell_stock_new
    @current_price = Stock.new_lookup(params[:ticker])
    @stock = UserStock.find(params[:id])
  end

  def sell_stock
    @stock = UserStock.find(params[:id])
    @transaction = Transaction.new(buy_params)
    @transaction.total_price = @transaction.price * @transaction.quantity
    @transaction.transaction_type = 1

    if @stock.quantity >= @transaction.quantity
      if @transaction.save
        flash[:notice] = 'Successfully Sell'
        user_balance = @current_user.balance + @transaction.total_price
        current_user.update(balance: user_balance)
        @stock.update(quantity: @stock.quantity - @transaction.quantity)
        redirect_to trader_stock_path
      else
        flash[:notice] = 'Error'
      end
    else
      redirect_to sell_stock_path(@stock.id)
      flash[:alert] = "Cannot sell. Your availble quantity stock is #{@stock.quantity}"
    end
  end

  def topup_money
    @user = User.find(current_user.id)
    new_money = params[:amount].to_f + @user.balance
    @user.update(balance: new_money)
    flash[:notice] = "Successfully add money $ #{params[:amount]}"
    redirect_to trader_stock_path
  end

  def transaction_history
    @transactions = Transaction.where(user_id: current_user.id).order('created_at ASC').paginate(page: params[:page], per_page: 10)
  end

  private

  def buy_params
    params.require(:stock).permit(:ticker, :company_name, :price, :total_price, :quantity, :user_id)
  end

  def stock_params
    params.require(:stock).permit(:ticker, :company_name, :price, :quantity, :user_id)
  end

  def require_trader
    return if current_user.role == 1

    flash[:alert] = 'You are not authorized to perform this action'
    redirect_to dashboard_admin_path
  end
end
