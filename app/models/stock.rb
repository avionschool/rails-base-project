class Stock < ApplicationRecord
  has_many :user_stocks, dependent: :nullify
  has_many :users, through: :user_stocks, dependent: :nullify
  has_many :transactionrecords, dependent: :nullify
  before_create :upcase_ticker
  validates :ticker, presence: true, length: { minimum: 1, maximum: 5 }, uniqueness: true

  def upcase_ticker
    ticker&.upcase!
  end

  def self.sandbox_api
    IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      secret_token: Rails.application.credentials.iex_client[:sandbox_secret_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
  end

  def self.iex_api
    IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:iexcloud_api_key],
      secret_token: Rails.application.credentials.iex_client[:iexcloud_secret_key],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
  end

  def self.new_lookup(ticker_symbol)
    client = sandbox_api
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
    rescue StandardError
      nil
    end
  end

  def self.check_db(ticker_symbol)
    find_by(ticker: ticker_symbol)
  end

  def userstock(current_user)
    user_stocks.find_by(user: current_user)
  end
end
