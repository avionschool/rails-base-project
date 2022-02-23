class User < ApplicationRecord
  has_one :wallet, dependent: :destroy
  has_many :portfolios, dependent: :destroy


  validates :fullname, presence: true, length: { minimum: 4 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end
end
