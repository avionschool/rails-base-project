class Tourist < User
  has_many :tourist_tours, dependent: :nullify
  has_many :tours, through: :tourist_tours

  has_many :travel_transactions, through: :tourist_tours
  has_many :reviews, dependent: :nullify
  has_many :chat_room_users, dependent: :nullify, foreign_key: 'user_id', inverse_of: :user
  has_many :chat_rooms, through: :chat_room_users

  after_create :set_approved_to_true

  def set_approved_to_true
    update(approved: true)
  end
end
