class Role < ApplicationRecord
  before_save { role.downcase! }
  validates :role, uniqueness: { case_sensitive: false }, presence: true
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles
end
