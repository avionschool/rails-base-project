class Trade < ApplicationRecord
  belongs_to :stock
  belongs_to :buy_order
  belongs_to :sell_order, optional: true

  validates :quantity, presence: true
  validates :price, presence: true

  def amount
    price * quantity
  end

  def buyer
    buy_order.user
  end

  def seller
    sell_order.user
  rescue NoMethodError
    nil
  end
end
