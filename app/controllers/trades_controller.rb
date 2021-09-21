class TradesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_stock
  before_action :find_user_stock
  before_action :set_transactions

  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)
    @trade.user_id = current_user.id
    @trade.stock_code = params[:stock_code]
    @trade.price = @stock.current_price
    @trade.total_price = CalculateTotalTradePrice.call(@stock, params[:trade][:quantity].to_i)

    if @trade.save
      flash[:notice] = 'Transaction completed.'
      update_wallet
      manage_user_stock
    else
      flash[:error] = "Transaction failed. #{@trade.errors.full_messages.first}"
    end
    redirect_to new_stock_trade_path
  end

  private

  def trade_params
    params.require(:trade).permit(
      :user_id,
      :stock_code,
      :price,
      :quantity,
      :transaction_type
    )
  end

  def set_transactions
    @transactions = current_user.trades.where(stock_code: @stock.code).order(:created_at).reverse
  end

  def find_stock
    @stock = Stock.find_by(code: params[:stock_code])
  end

  def find_user_stock
    @user_stock = current_user.user_stocks.find_by(stock_code: params[:stock_code])
  end

  def update_wallet
    UpdateUserWallet.call(current_user, @trade)
  end

  def manage_user_stock
    if @user_stock.present?
      UpdateUserStock.call(current_user, @user_stock, @trade)
    else
      CreateUserStock.call(current_user, @stock, @trade)
    end
  end
end
