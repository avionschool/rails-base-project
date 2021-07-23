class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    mine = ApplicationController.render(partial: 'messages/mine', locals: { message: @message })
    theirs = ApplicationController.render(partial: 'messages/theirs', locals: { message: @message })
    message = @message
    ActionCable.server.broadcast "room_channel_#{message.chat_room_id}", { mine: mine, theirs: theirs, message: message }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:body, :user_id, :chat_room_id)
  end
end
