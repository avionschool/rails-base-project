class ReviewCenter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, length: { maximum: 45 }
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 75 }
  validates :status, presence: true, on: :update
end
