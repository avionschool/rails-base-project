class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[show]
  def chat_user
    user = User.find(params[:user_id])
    ChatRoom.create(users: [current_user, user]) unless current_user.chat_room(user)
    redirect_to chat_rooms_path
  end

  def show
    @rooms = current_user.chat_rooms
    render 'index'
  end

  def index
    @rooms = current_user.chat_rooms
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = current_user.chat_rooms.find_by(id: params[:id])
    redirect_to chat_rooms_path unless @room
  end
end
