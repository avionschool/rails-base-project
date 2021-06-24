class Transact < ApplicationRecord
  validates :stock_id, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
