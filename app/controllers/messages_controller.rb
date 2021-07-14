class MessagesController < ApplicationController
    def create
        @message = Message.new(message_params)
        @message.user = current_user
        @message.save
        redirect_to request.referrer
    end

    private

    def message_params
        params.require(:message).permit(:conversation_id, :user_id, :content)
    end
end
