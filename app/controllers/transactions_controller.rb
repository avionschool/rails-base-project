class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show; end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:volume, :user_id, :stock_id, :price, :fulfilled, :transaction_type)
  end
end
