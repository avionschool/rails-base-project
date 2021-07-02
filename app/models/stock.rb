class Stock < ApplicationRecord
  validates :company, presence: true
  validates :ticker, presence: true
  validates :change_percent, presence: true
  validates :price, presence: true
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: ENV['PUBLISH_ACCESS_KEY'],
                                  secret_token: ENV['SECRET_ACCESS_KEY'],
                                  endpoint: 'https://sandbox.iexapis.com/v1')
    new(ticker: ticker_symbol, company: client.company(ticker_symbol).company_name, change_percent: client.quote(ticker_symbol).change_percent_s, price: client.price(ticker_symbol))
  end
end
