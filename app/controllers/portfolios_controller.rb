class PortfoliosController < ApplicationController
    before_action :get_transaction, only: %i[ show edit update destroy ]
    before_action :portfolio_operations
    before_action :request_api

    def index   
        @stock_symbol = @shares_ave.keys
        @sum = @shares_sum.values
        @ave = @shares_ave.values
    end

    def calculate_sell_price
        @stock_symbol = @shares_ave.keys
        @sum = @shares_sum.values
        @ave = @shares_ave.values
        
        @company = @client.company(params[:company])
        @quote = @client.quote(params[:company])

        @company_symbol = @company.symbol
        @current_price = @quote.latest_price

        @count_shares = params[:count_shares] 
        @result = @count_shares.to_f * @current_price.to_i
        render :index  
    end


    def sell_stock
        @transaction = current_user.transactions.build(transaction_params)

        if @transaction.save
            redirect_to transactions_path
        else
            render :new, status: :unprocessable_entity 
        end

        @final_shares = @shares_sum.where(:stock_symbol).sum(:count_shares) - @count_shares
    end

    private

    def request_api
        @client = IEX::Api::Client.new(
            publishable_token: 'pk_8e56851e45654ca5a7a4c19b5557b30d',
            secret_token: 'sk_1d81363bad404b98ab77a585c94d3c5c',
            endpoint: 'https://cloud.iexapis.com/v1'
        )       
    end
    
    def compute_total_price
        @total_price = @count_shares*@latest_price
    end

    def is_current_user
        @transactions = current_user.transactions.find_by(id: params[:user_id])
    end

    def portfolio_operations
        @shares_sum = current_user.transactions.group(:stock_symbol).sum(:count_shares)
        @shares_ave = current_user.transactions.group(:stock_symbol).average(:current_price)
    end

end
