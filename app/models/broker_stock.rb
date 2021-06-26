class BrokerStock < ApplicationRecord
    validates :user_id, presence: true
    validates :stock_id, presence: true
    validates :company, presence: true
    validates :ticker, presence: true
    validates :price, presence: true
    validates :created_at, presence: true
end
