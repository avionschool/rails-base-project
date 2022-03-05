class BalanceRequest < ApplicationRecord
  belongs_to :trader
  validates :amount, presence: true
end
