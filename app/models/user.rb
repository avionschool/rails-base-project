class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_pic
  has_one_attached :cover_pic
  has_many :messages

  def chat_room(user)
    chat_rooms.select { |chat_room| chat_room.users.include?(user)}.first
  end
  def tourist?
    type == "Tourist"
  end
  def agency?
    type == "Agency"
  end
  def admin?
    type == "Admin"
  end
  def username
    if self.agency?
      agency_name
    else
      "#{first_name} #{last_name}"
    end
  end
end
