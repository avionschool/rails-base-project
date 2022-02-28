class Trader < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :fullname, presence: true
  validates :username, presence: true
  def active_for_authentication?
    super && is_approved?
  end

  def inactive_message
    is_approved? ? super : :not_approved
  end
end
