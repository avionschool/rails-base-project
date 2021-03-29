class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :contact_number, presence: true, numericality: { only_integer: true }, length: { minimum: 10 }

  has_many :buyer_services
  has_many :services, :through => :buyer_services

  has_many :reviews
end
