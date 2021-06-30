class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  validates :company, presence: true
  validates :ticker, presence: true
  validates :price, presence: true
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:publish_access_key],
                                  secret_token: Rails.application.credentials.iex_client[:secret_access_key],
                                  endpoint: 'https://sandbox.iexapis.com/v1')
    new(ticker: ticker_symbol, company: client.company(ticker_symbol).company_name, price: client.price(ticker_symbol))
  end
end
