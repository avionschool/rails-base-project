class Wallet < ApplicationRecord
  belongs_to :user

  def self.total_deposits
    sum(:deposit)
    # if transaction_type == "credit"
    #   @user.update!(balance: @user.balance + @amount)
    #    elsif transaction_type == "debit"
    #   @user.update!(balance: @user.balance - @amount)
  end

  def self.total_balance
    total_deposits - total_withdrawals
  end
end
