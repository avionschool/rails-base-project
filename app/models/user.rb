class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :contact, :address, presence: true

  has_many :items, dependent: :restrict_with_exception
  has_many :comments, dependent: :restrict_with_exception
  has_many :reviews, dependent: :restrict_with_exception
end
