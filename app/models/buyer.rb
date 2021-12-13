class Buyer < ApplicationRecord
  belongs_to :admin
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable,, :timeoutable
end
