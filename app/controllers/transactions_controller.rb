class TransactionsController < ApplicationController

  def add_broker_stock
    @transaction = Transaction.new
    @transaction.user_id = current_user.id
    @transaction.broker_stock_id = params[:id]
    @transaction.amount = 0
    redirect_to stocks_path if @transaction.save
  end

end
