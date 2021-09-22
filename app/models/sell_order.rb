class SellOrder < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  enum status: {pending: 0, fulfilled: 1, cancelled: 2}
  scope :price_equal, ->(price) { where(price: price).order(price: :desc, quantity: :desc) }
  scope :quantity_equal, ->(quantity) { where(quantity: quantity).order(price: :desc, quantity: :desc) }

  def total
    price * quantity
  end

  def match_order
    BuyOrder.pending.price_equal(price).quantity_equal(quantity)
  end
end