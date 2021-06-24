class Broker < User
  has_many :brokers_stocks
#   has_many :brokers_stocks, dependent: :destroy
end
