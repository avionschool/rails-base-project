class Stock < ApplicationRecord
  has_many :broker_stocks
  has_many :brokers, through: :broker_stocks
  validates :name, :ticker, presence: true

  def self.new_search(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_access_key],
      secret_token: Rails.application.credentials.iex_client[:secret_access_key],
      # endpoint: 'https://sandbox.iexapis.com/v1'
      )

      begin
        new(
          ticker: ticker_symbol.upcase, 
          name: client.company(ticker_symbol).company_name, 
          last_price: client.quote(ticker_symbol).latest_price
        )
      rescue StandardError
        nil
      end
    end

def self.check_db(ticker_symbol)
  find_by(ticker: ticker_symbol)
end		   

end