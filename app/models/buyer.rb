class Buyer < User
  has_many :buyers_stocks
#   has_many :buyers_stocks, dependent: :destroy
end
