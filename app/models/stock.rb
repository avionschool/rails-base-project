class Stock < ApplicationRecord
    has_and_belongs_to_many :users, join_table: "buyers_stocks"
    has_many :transactions
    validates :volume, numericality: {greater_than_or_equal_to: 0}
    validates :code, uniqueness: true
    #Returns true if the stock code exists, false otherwise
    def self.exists?(code)
        !!self.find_by(code: code)
    end
end
