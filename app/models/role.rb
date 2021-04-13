class Role < ApplicationRecord
    has_and_belongs_to_many :user, foreign_key: "user_id"
end
