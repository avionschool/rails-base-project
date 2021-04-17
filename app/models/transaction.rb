class Transaction < ApplicationRecord
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 } 

    belongs_to :stock
end
