class BrokerStock < ApplicationRecord
  validates :user_id, presence: true
  validates :stock_id, presence: true
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
