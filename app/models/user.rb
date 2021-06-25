class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password_confirmation, presence: true

  def active_for_authentication?
    super && approved
  end

  def inactive_message
    approved ? super : :not_approved
  end
end
