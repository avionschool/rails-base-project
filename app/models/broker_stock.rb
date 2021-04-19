class BrokerStock < ApplicationRecord
  belongs_to :broker
  belongs_to :stock
end

