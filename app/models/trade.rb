class Trade < ApplicationRecord
  belongs_to :stock
  belongs_to :buy_order
  belongs_to :sell_order, optional: true

  validates :quantity, presence: true
  validates :price, presence: true

  def amount
    price * quantity
  end
  
end
