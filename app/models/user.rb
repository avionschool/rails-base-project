class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :contact, :address, presence: true

  has_many :items, dependent: :restrict_with_exception
  has_many :comments, dependent: :restrict_with_exception
  has_many :reviews, dependent: :restrict_with_exception
  has_many :messages


  def conversations
    # return all conversations where the current_user is a part of
    a = Conversation.where(user1_id: self)
    b = Conversation.where(user2_id: self)
    a.or(b).uniq
  end
end
