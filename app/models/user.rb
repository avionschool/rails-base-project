class User < ApplicationRecord
  validates :email, presence: true,  uniqueness: true
  validates :username, presence: true,  uniqueness: true
  validates :role, presence: true
  has_secure_password
end