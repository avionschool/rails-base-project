class TransactionsController < ApplicationController
  before_action :authenticate_user!

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
    def index
      if current_user.role == "admin"
        @transactions  = Transaction.all
      else
        @transactions = current_user.transactions.all
      end
    end
  end


  private
    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:total_amount, :quantity, :price, :stock_id, :seller_id, :buyer_id)
    end
end
