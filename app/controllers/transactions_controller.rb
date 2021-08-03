class TransactionsController < ApplicationController
    # before_action :calculate_total_price
    

    # def new
    #     @transaction = Transaction.build
    # end

 
    # def create
    #     @quote = @client.quote(params[:company])
    #     @current_price = @quote.latest_price
    #     # @current_price = @client.quote(params[:transaction][:current_price].to_i).latest_price
    #     @total_price = @current_price.to_f * params(:count_shares).to_i
    # end

    # def compute_total_price
    #     @result
    # end

    

    # private

    # def request_api
    #     @client = IEX::Api::Client.new(
    #         publishable_token: 'pk_8e56851e45654ca5a7a4c19b5557b30d',
    #         secret_token: 'sk_1d81363bad404b98ab77a585c94d3c5c',
    #         endpoint: 'https://cloud.iexapis.com/v1'
    #     )       
    # end

    # def transaction_params
    #     params.require(:transaction).permit(:count_shares, :current_price)
    # end

    
    # def current_price_params
    #     params.require(:transaction).permit(:count_shares, :current_price)
    # end
    

    # def calculate_total_price
    #     @quote = @client.quote(params[:company])
    #     @current_price = @quote.latest_price
    #     @current_price = @quote.latest_price
    #     @result = @count_shares * @current_price
    # end

    # # def compute_total_price
    # #     @total_price = @count_shares*@latest_price
    # # end
end
