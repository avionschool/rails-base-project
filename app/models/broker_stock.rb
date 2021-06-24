class BrokerStock < ApplicationRecord
  belongs_to :broker
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
