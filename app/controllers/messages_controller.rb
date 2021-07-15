class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    # redirect_to request.referer

    SendMessageJob.perform_later(@message)
  end

  private

  def message_params
    params.require(:message).permit(:conversation_id, :user_id, :content)
  end
end
