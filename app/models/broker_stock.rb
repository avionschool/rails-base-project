class BrokerStock < ApplicationRecord
  belongs_to :broker
  has_many :user_transactions, dependent: :destroy
  has_many :buyers, through: :user_transactions
  validates :symbol, presence: true
  validates :company_name, presence: true
end
