class User < ApplicationRecord
    has_and_belongs_to_many :role, foreign_key: "role_id"
    has_and_belongs_to_many :stock, join_table: "buyers_stocks", foreign_key: "stock_id"
end
