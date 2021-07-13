class Conversation < ApplicationRecord
    # how to approach dependent of messages? if a convo is destroyed, the other user's copy should not be automatically deleted
    has_many :messages, class_name: "Message", foreign_key: "conversation_id"
    belongs_to :user1, class_name: "User"
    belongs_to :user2, class_name: "User"

    # returns conversation participants in array
    def participants
        [self.user1_id, self.user2_id]
    end
end
