class Wallet < ApplicationRecord
  belongs_to :user

  def self.total_deposits
    sum(:deposit)
  end

  def self.total_withdrawals
    sum(:withdrawals)
  end

  def self.total_balance
    total_deposits - total_withdrawals
  end

  private

  def withdrawals_not_exceed_deposits
    if self.sum(:withdrawals) > self.sum(:deposit)
      errors.add(:base, 'Are you serious? You can\'t withdraw what you don\'t have')
    end
  end
end