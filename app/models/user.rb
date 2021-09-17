class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :rememberable, :confirmable
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :firstname, :lastname, presence: true, length: { maximum: 20 }
end
