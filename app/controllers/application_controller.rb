class ApplicationController < ActionController::Base
  include CustomExceptions
  rescue_from TransactionFailedError, with: :transaction_error

  private

  def transaction_error
    flash[:error] = 'Transaction failed.'
    redirect_to new_stock_trade_path and return
  end
end
