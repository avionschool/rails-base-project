class Stock < ApplicationRecord
    validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

    belongs_to :user
    has_many :transactions

end
