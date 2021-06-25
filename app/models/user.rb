class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true
  # validates_inclusion_of :role, :in => %w(Buyer Broker Admin)
  has_secure_password
end
