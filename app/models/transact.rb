class Transact < ApplicationRecord
  validates :broker_id, presence: true
  validates :buyer_id, presence: true
  validates :stock_id, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
