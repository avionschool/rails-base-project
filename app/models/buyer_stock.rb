class BuyerStock < ApplicationRecord
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
