class Stock < ApplicationRecord
  has_many :broker_stock, dependent: :destroy
  # has_many :users, through: :broker_stock
  has_many :brokers, -> { where(users: { user_types: [UserType.find_by(user_type: 'broker')] }) }, through: :broker_stock, source: :user
end
