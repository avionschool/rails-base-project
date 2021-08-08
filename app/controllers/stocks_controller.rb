class StocksController < ApplicationController
    before_action :request_api
    # before_action :calculate_total_price

    def index
        require 'iex-ruby-client'
    end

    def search
        @company = @client.company(params[:company])
        @quote = @client.quote(params[:company])
        @key_stats = @client.key_stats(params[:company]) 
        
        @company_symbol = @company.symbol
        @company_name = @company.company_name

        @current_price = @quote.latest_price
        @change_percent_s = @quote.change_percent_s   
        @outstanding_shares = @key_stats.shares_outstanding
        
        if @company
            render :index
        else
            flash[:alert] = 'Company not found'
            render :index
        end       
    end

    # def count_shares
    #     @count_shares
    # end

    def calculate_total_price
        @company = @client.company(params[:company])
        @quote = @client.quote(params[:company])
        @key_stats = @client.key_stats(params[:company]) 

        @company_symbol = @company.symbol
        @company_name = @company.company_name
        @current_price = @quote.latest_price

        @change_percent_s = @quote.change_percent_s   
        @outstanding_shares = @key_stats.shares_outstanding

        @count_shares = params[:count_shares]
        @result = @count_shares.to_f * @current_price.to_i

        @confirmation_message = "You are about to purchase #{@count_shares} share/s for $#{@result}."

        render :index
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



end
