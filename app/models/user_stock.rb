class UserStock < ApplicationRecord
  validates :user_id, presence: true
  validates :stock_code, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
