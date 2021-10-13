require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when validating user' do
    it 'is not valid without username' do
      user1 = described_class.new
      user1.username = nil

      expect(user1).not_to be_valid
    end

    it 'is not valid if username is less than 6 characters' do
      user2 = described_class.new
      user2.username = 'piggy'

      expect(user2).not_to be_valid
    end
  end
end
