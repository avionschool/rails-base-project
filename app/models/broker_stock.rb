class BrokerStock < ApplicationRecord
  belongs_to :broker

  validates :symbol, presence: true
  validates :company_name, presence: true
end
