class Stock < ApplicationRecord
  has_many :broker_stock, dependent: :destroy
  # has_many :users, through: :broker_stock --> Disabled to prevent stocks from calling users who are not brokers
  has_many :brokers, -> { where(users: { user_type_id: UserType.find_by(user_type: 'broker').id }) }, through: :broker_stock, source: :user
end
