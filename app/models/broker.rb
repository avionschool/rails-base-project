class Broker < User
  has_many :brokers_stocks, dependent: :nullify
  #   has_many :brokers_stocks, dependent: :destroy
end
