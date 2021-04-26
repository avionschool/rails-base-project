class Transaction < ApplicationRecord
  belongs_to :user

  before_save :compute_total_price

  def compute_total_price
    self.total_price = (quantity * price).round(2)
  end
end
