class Stock < ApplicationRecord
  def self.new_search(ticker)
    client = StockQuote::Stock.new(api_key: Rails.application.credentials.api_key)
      client.price(ticker)
  end
end