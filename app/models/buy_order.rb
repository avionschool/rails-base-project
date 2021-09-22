class BuyOrder < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  enum status: {pending: 0, fulfilled: 1, cancelled: 2}
  scope :price_equal, ->(price) { where(price: price).order(price: :desc, quantity: :desc) }
  scope :quantity_equal, ->(quantity) { where(quantity: quantity).order(price: :desc, quantity: :desc) }

  def total
    price * quantity
  end

  def match_order
    SellOrder.pending.price_equal(price).quantity_equal(quantity)
  end

  def complete_order
    Trade.create(stock: stock, price: price, quantity: quantity) if match_order.present?
  end
end