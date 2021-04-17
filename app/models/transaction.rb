class Transaction < ApplicationRecord

    belongs_to :stock
    belongs_to :user

    validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 } 
end
