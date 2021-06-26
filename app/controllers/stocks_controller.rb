class StocksController < ApplicationController
    def index
    
    end


    def show
        @client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_publishable_token,
            secret_token: Rails.application.credentials.iex_secret_token,
            endpoint: 'https://sandbox.iexapis.com/v1'
        )

        @stock = Stock.find(params[:id])
        @chart = @client.chart(@stock.symbol, '1d', chart_interval: 10)
       
    end

    

    def stock_params
        params.require(:stock).permit(:symbol, :companyname)
    end
end
