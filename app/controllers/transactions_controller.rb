class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show; end

  def new
    render :new
  end

  def create
    case params[:transaction_type]
    when 'Buy'
      current_user.buy_stock(Stock.find(params[:stock_id]).code, params[:volume], params[:price])
    when 'Sell'
      current_user.sell_stock(Stock.find(params[:stock_id]).code, params[:volume], params[:price])
    end
  end

  def update
    current_user.process_transaction(@transaction, params[:volume])
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:volume, :user_id, :stock_id, :price, :fulfilled, :transaction_type)
  end
end
