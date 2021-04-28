class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all.where.not(user_id: current_user.id)
    @listings = Transaction.available_listings.where.not(user_id: current_user.id)
    @sells = Transaction.sell_listings.where.not(user_id: current_user.id)
    @buys = Transaction.buy_listings.where.not(user_id: current_user.id)
    @top10 = Stock.most_active
    render :index
  end

  def show
    @top10 = Stock.most_active
    render :show
  end

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
