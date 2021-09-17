class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :rememberable, :confirmable
  validates :username, presence: true, uniqueness: true
  validates :firstname, :lastname, presence: true, length: { maximum: 20 }
  
end
