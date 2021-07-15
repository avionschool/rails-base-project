class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(msg)
    own_message = ApplicationController.render(partial: 'messages/own_message', locals: { message: msg })
    not_own_message = ApplicationController.render(partial: 'messages/not_own_message', locals: { message: msg })
    ActionCable.server.broadcast "conversation_channel_#{msg.conversation_id}", { own_message: own_message, not_own_message: not_own_message, message: msg }
  end
end
