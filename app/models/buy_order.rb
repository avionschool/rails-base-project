class BuyOrder < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  has_one :trade, dependent: :destroy
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
    if match_order.any?
      if match_order.first.trade.nil?
        create_trade(stock: stock, price: price, quantity: quantity, buyer: user.email, buy_order: self)
      else
        match_order.first.trade.update(stock: stock, price: price, quantity: quantity, buyer: user.email, buy_order: self)
      end
      match_order.first.update(status: 1)
      update(status: 1)
    else
      create_trade(stock: stock, price: price, quantity: quantity, buyer: user.email, buy_order: self)
    end
  end
end
