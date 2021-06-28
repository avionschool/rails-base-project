class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  scope :brokerstocks, lambda {
    joins(:user).where(users: { role: 'broker' })
  }
  validates :average_price, numericality: { greater_than: 0 }, if: :user_buyer?
  validates :total_shares, numericality: { greater_than: 0 }, if: :user_buyer?
  def user_buyer?
    self&.user&.buyer?
  end

  def market_value
    format('%.2f', (total_shares * stock.last_price.to_f))
  end

  def net_cost
    format('%.2f', (total_shares * average_price.to_f))
  end

  def gain_loss
    format('%.2f', (market_value.to_f - net_cost.to_f))
  end

  def percent_gain_loss
    format('%.2f', ((gain_loss.to_f / net_cost.to_i) * 100))
  end
end
