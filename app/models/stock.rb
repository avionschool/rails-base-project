class Stock < ApplicationRecord
    has_many :broker_stocks
    has_many :brokers, through: :broker_stocks

    # Did not include :price because it changes
    validates :name, :ticker, presence: true

    def self.new_search(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: ENV['IEX_PUBLISHABLE_KEY'],
            secret_token: ENV['IEX_SECRET_KEY'],
            endpoint: 'https://sandbox.iexapis.com/v1'
          )
        begin
            #ticker is upcased because if not, it doesn't recognize that I've already added the same stock
            new(ticker: ticker_symbol.upcase, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
        rescue => exception
            return nil
        end
    end

    def self.check_db(ticker_symbol)
        find_by(ticker: ticker_symbol)
    end
    
end
