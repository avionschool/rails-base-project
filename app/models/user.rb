class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :first_name, :last_name, :contact, :address, presence: true
  validates :username, presence: true, uniqueness: true
  validate :avatar_filesize

  has_one_attached :avatar
  has_many :items, dependent: :restrict_with_exception
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :restrict_with_exception
  # how to approach dependence of messages? if a message is destroyed, the other user's copy should not be automatically deleted
  has_many :messages, dependent: :destroy

  def conversations
    # return all conversations where the current_user is a part of
    a = Conversation.where(user1_id: self)
    b = Conversation.where(user2_id: self)
    a.or(b).uniq
  end

  def thumbnail
    avatar.variant(combine_options: { thumbnail: '300x300^', gravity: 'center', extent: '300x300' })
  end

  private

  def avatar_filesize
    errors.add(:avatar, 'file size should not exceed 1 MB!') if avatar.attached? && avatar.byte_size >= 1.megabyte
  end
end
