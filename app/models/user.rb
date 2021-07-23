class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_pic
  has_one_attached :cover_pic
  has_many :messages, dependent: :nullify
  after_create :sign_up_mailer

  def chat_room(user)
    chat_rooms.select { |chat_room| chat_room.users.include?(user) }.first
  end

  def sign_up_mailer
    UserMailer.welcome_send(self).deliver
  end

  def tourist?
    type == 'Tourist'
  end

  def agency?
    type == 'Agency'
  end

  def admin?
    type == 'Admin'
  end

  def username
    if agency?
      agency_name
    else
      "#{first_name} #{last_name}"
    end
  end

  def active_for_authentication?
    super && approved
  end

  def inactive_message
    approved ? super : :not_approved
  end
end
