require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when user signing in check validations' do
    it 'is not allowed w/o email' do
      user = described_class.new(email: nil, username: 'mumble-07', full_name: 'Andy Lang', password: 'sample_password')

      expect(user).not_to be_valid
    end

    it 'is not allowed w/o uname' do
      user = described_class.new(email: 'mumble-07@gmail.com', username: nil, full_name: 'Andy Lang', password: 'sample_password')

      expect(user).not_to be_valid
    end

    it 'is not allowed w/o fname' do
      user = described_class.new(email: 'mumble-07@gmail.com', username: 'mumble-07', full_name: nil, password: 'sample_password')

      expect(user).not_to be_valid
    end

    it 'is not allowed w/o pw' do
      user = described_class.new(email: 'mumble-07@gmail.com', username: 'mumble-07', full_name: 'Andy', password: nil)

      expect(user).not_to be_valid
    end
  end
end
