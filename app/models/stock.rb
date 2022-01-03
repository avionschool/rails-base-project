class Stock < ApplicationRecord
  validates :stock_symbol, presence: true
  validates :current_price, presence: true
end
