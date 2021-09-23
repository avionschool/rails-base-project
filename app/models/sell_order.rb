class SellOrder < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  has_many :trades, dependent: :destroy
  enum status: { pending: 0, fulfilled: 1, cancelled: 2 }
  scope :price_equal, ->(price) { where(price: price).order(price: :desc, quantity: :desc) }
  scope :quantity_equal, ->(quantity) { where(quantity: quantity).order(price: :desc, quantity: :desc) }

  def total
    price * quantity
  end

  def match_order
    BuyOrder.pending.price_equal(price).quantity_equal(quantity)
  end

  def complete_order
    return unless match_order.present?

    trades.create(stock: stock, price: price, quantity: quantity, buy_order: match_order.first)
    update(status: 1)
  end

  def enough_quantity?
    user.quantity(stock) >= quantity
  end

  def error_message_invalid_quantity
    errors.add(:quantity, "You don't have enough shares to sell") unless enough_quantity?
  end
end
