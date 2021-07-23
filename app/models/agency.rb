class Agency < User
  has_many :tours, dependent: :nullify
  has_many :travel_transactions, dependent: :nullify

  has_many :reviews, dependent: :nullify
  has_many :chat_room_users, dependent: :nullify, foreign_key: 'user_id', inverse_of: :user
  has_many :chat_rooms, through: :chat_room_users
end
