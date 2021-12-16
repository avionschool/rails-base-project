class Stock < ApplicationRecord
    API_KEY= Rails.application.credentials.config[:stocks_api_key]

    def render_stock(ticker)
        init_api
        return stock = StockQuote::Stock.quote(ticker)
    end

    def init_api
        StockQuote::Stock.new(api_key: API_KEY)
    end
end
