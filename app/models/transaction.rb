class Transaction < ApplicationRecord
  validates :company, presence: true
  validates :ticker, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
