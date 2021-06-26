class Transaction < ApplicationRecord
    validates :user_id, presence: true
    validates :stock_id, presence: true
    validates :broker_id, presence: true
    validates :total_price, presence: true
    validates :quantity, presence: true
    validates :company, presence: true
    validates :ticker, presence: true
    validates :price, presence: true
    validates :created_at, presence: true
end
