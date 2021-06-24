class Stock < ApplicationRecord
  has_many :broker_stocks, dependent: :destroy
  # has_many :users, through: :broker_stock --> Disabled to prevent stocks from calling users who are not brokers
  has_many :brokers, -> { where(users: { user_type_id: UserType.find_by(user_type: 'broker').id }) }, through: :broker_stock, source: :user

  # Fetch top 10 stocks from IEX API
  def self.most_active_stocks
    IEX::Api::Client.new(
      publishable_token: ENV['IEX_PUBLISHABLE_TOKEN'],
      secret_token: ENV['IEX_SECRET_TOKEN'],
      endpoint: 'https://sandbox.iexapis.com/v1'
    ).stock_market_list(:mostactive)
  end
end
