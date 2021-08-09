class TransactionsController < ApplicationController
    before_action :set_transaction, only: %i[ show edit update destroy ]

    def index
        @transactions = current_user.transactions
    end

    def new
        @transaction = current_user.transactions.new
    end

    def show
    end

    def buy_stock
        @transaction = current_user.transactions.build(transaction_params)
    
        if @transaction.save
            redirect_to transactions_path
        else
            render :new, status: :unprocessable_entity 
        end

    end

    private
    
    def set_transaction
        @transaction = current_user.transactions.find(params[:id])
    end

    def transaction_params        
        params.require(:transaction).permit(:stock_name, :stock_symbol, :current_price, :count_shares, :total_price, :user_id)
    end                                                                                                

    def is_current_user
        @transaction = current_user.transactions.find_by(id: params[:user_id])
    end

end
