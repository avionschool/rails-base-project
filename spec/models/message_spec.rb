require 'rails_helper'

RSpec.describe Message, type: :model do
  let!(:message) { described_class.new }


  context 'with validations of relationship' do
    it 'belongs to chat room' do
      expect(message).to belong_to(:chat_room)
    end

    it 'belongs to a user' do
      expect(message).to belong_to(:user)
    end
  end
end
