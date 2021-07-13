class Conversation < ApplicationRecord
  # how to approach dependence of messages? if a convo is destroyed, the other user's copy should not be automatically deleted
  has_many :messages, class_name: 'Message', dependent: :destroy
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'

  # returns conversation participants in array
  def participants
    [user1_id, user2_id]
  end
end
