class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :stock, foreign_key: 'stock_code', inverse_of: :trades

  enum transaction_type: { buy: 0, sell: 1 }
  validates :user_id, presence: true
  validates :stock_code, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0, integer_only: true }
  validates :transaction_type, presence: true
  validates :total_price, presence: true
  validate :sufficient_balance?
  validate :enough_stocks?

  def sufficient_balance?
    user_wallet = Wallet.find_by(user_id: user_id)
    user_wallet_balance = user_wallet.try { running_balance }

    return errors.add(:total_price, 'is exceeding your wallet balance, or you might not have an existing wallet.') if transaction_type == 'buy' && user_wallet_balance.nil?

    errors.add(:total_price, 'is exceeding your wallet balance') if transaction_type == 'buy' && user_wallet_balance < total_price
  end

  def enough_stocks?
    user_stock = UserStock.find_by(user_id: user_id, stock_code: stock_code)
    user_stock_quantity = user_stock.try { quantity }

    return if quantity.nil?

    return errors.add(:quantity, 'being sold is exceeding your stocks') if transaction_type == 'sell' && user_stock_quantity.nil?
    return errors.add(:quantity, 'being sold is exceeding your stocks') if transaction_type == 'sell' && user_stock_quantity < quantity
  end
end
