require 'rails_helper'

RSpec.describe User, type: :model do
  new_user = described_class.new(email: 'user@email.com', username: 'new_user', password: 'qwerty', password_confirmation: 'qwerty')

  describe 'Validations' do
    it 'is not valid without an email' do
      new_user.email = nil
      expect(new_user).not_to be_valid
    end

    it 'is not valid without a username' do
      new_user.username = nil
      expect(new_user).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:foods) }
  end
end
