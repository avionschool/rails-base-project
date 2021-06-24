class Transactionrecord < ApplicationRecord
  enum transactiontype: { buy: 0, sell: 1, add: 2, remove: 3 }
  belongs_to :broker, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
  belongs_to :stock

  validates :stock_price, numericality: { greater_than: 0 }, if: :transaction_buy_or_sell?
  validates :total_price, numericality: { greater_than: 0 }, if: :transaction_buy_or_sell?
  validates :quantity, numericality: { greater_than: 0 }, if: :transaction_buy_or_sell?

  def transaction_buy_or_sell?
    self&.buy? || self&.sell?
  end
end
