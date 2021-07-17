require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  let!(:chat_room) { described_class.new }


  context 'with validations of relationship' do
    it 'belongs to messages' do
      expect(chat_room).to have_many(:messages)
    end

    it 'belongs to a chat room users' do
      expect(chat_room).to have_many(:chat_room_users)
    end

    it 'belongs to a users' do
      expect(chat_room).to have_many(:users)
    end
  end
end
