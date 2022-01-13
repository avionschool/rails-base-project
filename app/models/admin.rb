class Admin < ApplicationRecord
  has_many :brokers
  has_many :buyers
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable, :timeoutable
end
