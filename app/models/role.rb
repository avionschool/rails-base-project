class Role < ApplicationRecord
    has_many :User
    validates :role_name, presence: true
end
