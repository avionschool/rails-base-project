class Stock < ApplicationRecord
  validates :company, presence: true
  validates :ticker, presence: true
  validates :price, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
                                  endpoint: 'https://sandbox.iexapis.com/v1')
    new(ticker: ticker_symbol, company: client.company(ticker_symbol).company_name, price: client.price(ticker_symbol))
  end
end
