class Stock < ApplicationRecord

    belongs_to :user
    has_many :transactions

    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
