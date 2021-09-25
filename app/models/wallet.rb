class Wallet < ApplicationRecord
  belongs_to :user

  validates :deposit, :withdraw, :id, :user_id, :updated_at, :created_at, presence: true

  def total_deposits
     # balance += deposit
    sum(:deposit)
  if transaction_type == "deposit"
    @user.update!(balance: @user.balance + @amount)
     elsif transaction_type == "withdraw"
    @user.update!(balance: @user.balance - @amount)
     end
  end

  def total_balance
    deposit - withdrawal
    total_balance += deposit
    # balance -= withdrawal
  end
end
