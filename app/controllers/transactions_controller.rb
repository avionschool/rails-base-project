class TransactionsController < ApplicationController
  before_action :set_traders
  before_action :set_transactions

  def index
    @transactions = current_user.transactions
  end

  private

  def set_traders
    @trader = current_user.transactions.find(params[:user_id])
  end

  def set_transactions
    @transaction = @trader.transactions.find(params[:id])
  end
end
