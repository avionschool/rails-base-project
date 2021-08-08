class PortfoliosController < ApplicationController
    before_action :get_transaction, only: %i[ show edit update destroy ]

    def index   
        @shares_sum = current_user.transactions.group(:stock_symbol).sum(:count_shares)
        @shares_ave = current_user.transactions.group(:stock_symbol).average(:current_price)
        @stock_symbol = @shares_ave.keys
    end

    def find_or_create_by

    end

    def set_transaction
        @transaction = Transaction.find(params[:id])
    end

    def is_current_user
        @transactions = current_user.transactions.find_by(id: params[:user_id])
    end


end
