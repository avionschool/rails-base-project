class StockHolding < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :stock_symbol, presence: true
end
