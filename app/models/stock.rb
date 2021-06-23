class Stock < ApplicationRecord
  has_many :broker_stocks, dependent: :destroy
  # has_many :users, through: :broker_stock --> Disabled to prevent stocks from calling users who are not brokers
  has_many :brokers, -> { where(users: { user_type_id: UserType.find_by(user_type: 'broker').id }) }, through: :broker_stock, source: :user

  # Fetch top 10 stocks from IEX API
  def self.most_active_stocks
    IEX::Api::Client.new(
      publishable_token: 'Tpk_1b73e94d5c7a45839071c3c6fa651dbe',
      secret_token: 'Tsk_3f7e77a8a28142a3b816b9ea86c1efea',
      endpoint: 'https://sandbox.iexapis.com/v1'
    ).stock_market_list(:mostactive)
  end
end
