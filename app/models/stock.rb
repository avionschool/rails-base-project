class Stock < ApplicationRecord
    has_many :broker_stocks
    has_many :brokers, through: :broker_stocks

    # Did not include :price because it changes
    validates :name, :ticker, presence: true

    def self.new_search(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: ENV["IEX_PUBLISHABLE_KEY"],
            secret_token: ENV["IEX_SECRET_KEY"],
            # publishable_token: Rails.application.credentials.iex_client[:publishable_access_key],
            # secret_token: Rails.application.credentials.iex_client[:secret_access_key],
            endpoint: 'https://sandbox.iexapis.com/v1'
          )
        begin
            #ticker is upcased because if not, it doesn't recognize that I've already added the same stock
            new(ticker: ticker_symbol.upcase, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
        rescue => exception
            return nil
        end
    end

    def self.check_db(ticker_symbol, broker_id)
        find_by(ticker: ticker_symbol, added_by: broker_id)
    end
    
    # Doesn't work in Sandbox ENV
    # def self.stock_logo(ticker_symbol)
    #     client = IEX::Api::Client.new(
    #         publishable_token: ENV["IEX_PUBLISHABLE_KEY"],
    #         secret_token: ENV["IEX_SECRET_KEY"],
    #         # publishable_token: Rails.application.credentials.iex_client[:publishable_access_key],
    #         # secret_token: Rails.application.credentials.iex_client[:secret_access_key],
    #         endpoint: 'https://cloud.iexapis.com/v1'
    #       )
    #     logo = client.logo(ticker_symbol)
    #     logo.url
    # end
end