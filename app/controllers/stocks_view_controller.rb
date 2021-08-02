class StocksViewController < ApplicationController
    # require '../config/iex_client'
    # require 'iex-ruby-client'

    # client = IEX::Api::Client.new(
    #     publishable_token: 'pk_8602e5e277754e71b57e9e56bad4d6a8',
    #     secret_token: 'sk_bedf09f6562c479381c77a73f4788d6d',
    #     endpoint: 'https://cloud.iexapis.com/v1'
    #   )

    def index
        client = IEX::Api::Client.new(
            publishable_token: 'pk_8602e5e277754e71b57e9e56bad4d6a8',
            secret_token: 'sk_bedf09f6562c479381c77a73f4788d6d',
            endpoint: 'https://cloud.iexapis.com/v1'
          )
        
        @quote = client.quote('MSFT')

        stocks_list = ['MSFT']
        # , 'FB', 'PYPL', 'NVDA', 'MDLZ', 'ZM', 'CTSH', 'WDAY' , 'AAPL'
        # , 'TSLA'
        @stocks_view = []

        stocks_list.each do |item|
            stock = client.quote(item)
            @stocks_view.push(stock)
        end
    end

    def show
        symbol = params[:stocksymbol]
        client = IEX::Api::Client.new(
            publishable_token: 'pk_8602e5e277754e71b57e9e56bad4d6a8',
            secret_token: 'sk_bedf09f6562c479381c77a73f4788d6d',
            endpoint: 'https://cloud.iexapis.com/v1'
          )
        
        @quote = client.quote(symbol)
    end
end
