class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :broker_stock
  has_many :transaction_logs, dependent: :destroy
  # Validations
  validates :broker_stock_id, uniqueness: {scope: :user_id}
end
