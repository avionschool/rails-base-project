class Market < ApplicationRecord
  validates :market_symbol, presence: true
  validates :curr_price, presence: true
  validates :name, presence: true
end
