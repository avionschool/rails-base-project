class BrokerStock < ApplicationRecord
  belongs_to :broker
  #   validates :companyname, presence: true
  #   validates :quantity, presence: true
  #   validates :price, presence: true
end
