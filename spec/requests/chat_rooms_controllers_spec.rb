require 'rails_helper'

RSpec.describe 'ChatRoomsControllers', type: :request do
  let!(:admin) { create(:admin) }
  let!(:tourist) { create(:tourist) }
  let!(:tourist2) { create(:tourist) }
  let!(:agency) { create(:approved_agency) }
  let!(:chat_room) { ChatRoom.create }

  before do
    chat_room.users << tourist
    chat_room.users << agency
  end

  describe 'GET chat_rooms#index path' do
    it 'returns a redirect response if not logged_in' do
      get chat_rooms_path
      expect(response).to have_http_status(:found)
    end

    it 'returns a success response if logged_in' do
      sign_in(admin)
      sign_in(tourist)
      get chat_rooms_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET  /chat_rooms/:id show path request response for different users' do
    it 'returns a redirect response if not logged_in' do
      get chat_room_path(chat_room)
      expect(response).to have_http_status(:found)
    end

    it 'returns a success response if logged_in user owns the chatroom' do
      sign_in(tourist)
      get chat_room_path(chat_room)
      expect(response).to have_http_status(:ok)
    end

    it 'returns a redirect response if logged_in user is not the owener of the chatroom' do
      sign_in(tourist2)
      get chat_room_path(chat_room)
      expect(response).to have_http_status(:found)
    end
  end
end
