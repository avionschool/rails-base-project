class Role < ApplicationRecord
  validates :role_name, presence: true
  belongs_to :user
end
