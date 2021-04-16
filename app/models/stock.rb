class Stock < ApplicationRecord

    def self.new_search(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:publishable_access_key],
            secret_token: Rails.application.credentials.iex_client[:secret_access_key],
            endpoint: 'https://sandbox.iexapis.com/v1'
          )
        client.price(ticker_symbol)
    end
end
