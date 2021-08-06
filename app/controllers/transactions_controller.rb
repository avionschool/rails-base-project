class TransactionsController < ApplicationController
    before_action :set_transaction, only: %i[ show edit update destroy ]

    def index
        @transactions = Transaction.all
    end

    def new
        @transaction = Transaction.new
    end

    def create
        @transaction = Transaction.new(params[:transaction])

        if @transaction.save
            redirect_to @transaction
          else
            render :new, status: :unprocessable_entity 
          end
    end

    private
    
    def set_transaction
        @transaction = Transaction.find(params[:id])
    end

    def transaction_params
        params.require(:transaction).permit(:company, :stock_symbol, :current_price.to_f, :count_shares.to_i, :total_price)
    end


    

end
