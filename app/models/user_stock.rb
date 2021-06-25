class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :average_price, numericality: { greater_than: 0 }, if: :user_buyer?
  validates :total_shares, numericality: { greater_than: 0 }, if: :user_buyer?
  def user_buyer?
    self&.user&.buyer?
  end
end
