class Stock < ApplicationRecord
  has_many_dependent :user_stocks
  has_many :users, through: :user_stocks

  def self.new_lookup(stock_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.aws[:publishable_token],
      secret_token: Rails.application.credentials.aws[:secret_token],
      endpoint: 'https://sandbox.iexapis.com/stable'
    )
    begin
      new(stock_symbol: stock_symbol, logo: client.company(stock_symbol).company_name, current_price: client.price(stock_symbol))
    rescue StandardError
      nil
    end
  end

  def self.check_db(stock_symbol)
    where(stock_symbol: stock_symbol).first
  end
end
