require 'rails_helper'

RSpec.describe ChatRoomUser, type: :model do
  let!(:chat_room_user) { described_class.new }

  context 'with validations of relationship' do
    it 'belongs to tourist tour' do
      expect(chat_room_user).to belong_to(:user)
    end

    it 'belongs to a agency' do
      expect(chat_room_user).to belong_to(:chat_room)
    end
  end
end
