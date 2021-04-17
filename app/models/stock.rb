class Stock < ApplicationRecord
    has_and_belongs_to_many :users, join_table: "buyers_stocks", foreign_key: "users_id"
    validates :volume, numericality: {greater_than_or_equal_to: 0}
    validates :code, uniqueness: true
end
