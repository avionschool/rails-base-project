class Portfolio < ApplicationRecord
  belongs_to :user

  validates :market_symbol, presence: true
  validates :hist_price, presence: true
  validates :user_id, presence: true
end
