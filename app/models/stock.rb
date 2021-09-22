class Stock < ApplicationRecord
  has_many :user_stocks, dependent: :destroy
  has_many :users, through: :user_stocks
  has_many :buy_orders, dependent: :destroy
  has_many :sell_orders, dependent: :destroy

  validates :name, :ticker, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
                                    endpoint: 'https://sandbox.iexapis.com/v1')
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol), logo: client.logo(ticker_symbol).url, prices: client.chart(ticker_symbol, '1m').to_json)
    rescue IEX::Errors::SymbolNotFoundError
      nil
    end
  end

  def self.check_stock(ticker_symbol)
    Stock.where(ticker: ticker_symbol).first
  end
end
