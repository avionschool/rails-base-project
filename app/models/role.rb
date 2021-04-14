class Role < ApplicationRecord
    validates :role_name, presence:true, uniqueness: true
    belongs_to :user
end
