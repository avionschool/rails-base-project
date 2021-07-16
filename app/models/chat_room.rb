class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :nullify
  has_many :chat_room_users, dependent: :nullify
  has_many :users, through: :chat_room_users

  def chat_mate(current_user)
    users.reject { |user| user == current_user }.first
  end
end
