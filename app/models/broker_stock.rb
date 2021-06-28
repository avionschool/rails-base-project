class BrokerStock < ApplicationRecord
  validates :company, presence: true
  validates :ticker, presence: true
  validates :price, presence: true
end
