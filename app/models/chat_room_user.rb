class ChatRoomUser < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :chat_room
end
