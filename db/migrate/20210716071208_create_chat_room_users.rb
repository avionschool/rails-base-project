class CreateChatRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_room_users do |t|
      t.belongs_to :user
      t.belongs_to :chat_room 
      t.timestamps
    end
  end
end
