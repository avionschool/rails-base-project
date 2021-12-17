class Stock < ApplicationRecord
    API_KEY= Rails.application.credentials.config[:stocks_api_key]

    def Stock.render_stock(ticker)
        begin
        self.init_api
        stock = StockQuote::Stock.quote(ticker)
        rescue
        end
    end

    def Stock.render_logo(ticker)
        begin
            self.init_api
            logo = StockQuote::Stock.logo(ticker)
        rescue
        end
    end

    def Stock.list_stocks
        list = ['AAPL', 'GOOG', 'VOO', 'KO', 'AMZN', 'MSFT', 'FB', 'TSLA', 'DIS']
        list.each do |ticks|
            data = self.render_stock(ticks)
            logo = self.render_logo(ticks)
            create(ticker: ticks, logo_url: logo.url, name: data.company_name, current_price: data.latest_price)
        end
        
    end

    def Stock.init_api
        StockQuote::Stock.new(api_key: API_KEY)
    end
end
