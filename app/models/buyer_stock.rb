class BuyerStock < ApplicationRecord
  validates :user_id, :ticker, :company, :quantity, :price, presence: true

  belongs_to :user

  before_save :compute_total_price

  def compute_total_price
    self.total_price = (quantity * price).round(2)
  end
end
