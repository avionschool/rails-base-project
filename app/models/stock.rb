class Stock < ApplicationRecord
  has_many :user_stocks, dependent: :destroy
  validates :company_name, presence: true
  validates :ticker, presence: true, uniqueness: true
  validates :stock_price, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_b109cb59615f44edb9949f4b6b4af1f4',
      secret_token: 'Tsk_cc9973707b4a43fe803fe0fc7e9d175e',
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      create(ticker: client.company(ticker_symbol).symbol, company_name: client.company(ticker_symbol).company_name, stock_price: client.price(ticker_symbol))
    rescue StandardError
      nil
    end
  end
end
