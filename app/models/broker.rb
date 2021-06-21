class Broker < User
  has_many :broker_stocks, dependent: :destroy
end
