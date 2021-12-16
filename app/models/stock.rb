class Stock < ApplicationRecord
    API_KEY= Rails.application.credentials.config[:stocks_api_key]

    def render_stock(ticker)
        begin
        init_api
        stock = StockQuote::Stock.quote(ticker)
        rescue
        end
    end

    def render_logo(ticker)
        begin
            init_api
            logo = StockQuote::Stock.logo(ticker)
        rescue
        end
    end

    def list_stocks
        list = ['AAPL', 'GOOG', 'VOO', 'VOOG', 'AMZN', 'MSFT', 'BKSA', 'TSLA', 'DIS']
        
        list.each do |ticks|
            render_stock(ticks)
            create(ticker: ticks, )
        end
        
    end

    def init_api
        StockQuote::Stock.new(api_key: API_KEY)
    end
end
