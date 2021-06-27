class UserTransactionsController < ApplicationController
  before_action :authenticate_user!
  def index
    if buyer_signed_in?
      @transactions = current_buyer.user_transactions
    elsif broker_signed_in?
      @broker_transactions = current_broker.broker_stocks.map(&:user_transactions)
    end
  end
end
