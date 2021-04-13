class User < ApplicationRecord
    has_and_belongs_to_many :role, foreign_key: "role_id"
    has_many :stock, class_name: "stock", foreign_key: "stock_id"
end
