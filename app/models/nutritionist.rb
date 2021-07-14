class Nutritionist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:username]

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :license_num, presence: true
  validates :years_exp, presence: true
  has_many :articles, dependent: :destroy

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end
end
