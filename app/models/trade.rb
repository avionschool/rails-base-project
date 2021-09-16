class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :stock, foreign_key: 'stock_code', inverse_of: :trades

  enum transaction_type: { buy: 0, sell: 1 }
  validates :user_id, presence: true
  validates :stock_code, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :transaction_type, presence: true
end
