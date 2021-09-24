class BuyOrder < ApplicationRecord
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
    SellOrder.pending.price_equal(price).quantity_equal(quantity)
  end

  def complete_order
    return if match_order.blank?

    trades.create(stock: stock, price: price, quantity: quantity, sell_order: match_order.first)
    match_order.first.update(status: 1)
    update(status: 1)
  end
end
