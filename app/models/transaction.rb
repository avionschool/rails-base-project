class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :broker_stock
  has_many :transaction_logs, dependent: :destroy
end
