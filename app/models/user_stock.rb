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
    '%.2f' % (self.total_shares * self.stock.last_price.to_f)
  end
  def net_cost
    '%.2f' % (self.total_shares * self.average_price.to_f)
  end 
  def gain_loss
    '%.2f' % (self.market_value.to_f - self.net_cost.to_f)
  end
  def percent_gain_loss
    '%.2f' % ((self.gain_loss.to_f/self.net_cost.to_f)*100)
  end
end
