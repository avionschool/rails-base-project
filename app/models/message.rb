class Message < ApplicationRecord
    belongs_to :conversation, class_name: "Conversation"
    belongs_to :user, class_name: "User"

    def sender
        self.user_id
    end
end
