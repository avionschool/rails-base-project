require 'json'

module StockDataFinder
  class Client
    # symbols='AAPL,ADBE,AMD,AMZN,CRM,GOOG,FB,JPM,TSLA,MA,MSFT,NEE,NVDA,SBUX,UNH,V,WMT'
    #  SYMBOLS = 'AAPL,AMZN,GOOG,MSFT,NVDA,TSLA,MA,JPM,WMT,V,NEE,UNH,CRM,ADBE,AMD,FB,SBUX,SQ,HD,MCD,PYPL,BA,NFLX,NOW'
     SYMBOLS = 'NVDA,TSLA,SBUX,'
      def self.price_update
            response = Request.call(http_method: 'get', endpoint:"/v1/data/quote?symbols=#{SYMBOLS}")
            if !response.nil?
                response[:data]["data"].map do |stock_info|
                    if Stock.exists?(stock_symbol: stock_info["ticker"])
                        new_stock = Stock.find_by(stock_symbol: stock_info["ticker"])
                        new_stock.current_price = stock_info["price"]
                        new_stock.save
                    else
                        Stock.create(stock_symbol: stock_info['ticker'], current_price: stock_info['price'])
                    end
                end
            end
        end
        def self.api_check
            response = Request.call(http_method: 'get', endpoint:"/v1/data/quote?symbols=#{SYMBOLS}")
        end
    end
end
        