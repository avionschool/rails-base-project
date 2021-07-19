require 'rails_helper'

RSpec.describe Admin, type: :model do
  new_admin = described_class.new(email: 'admin@email.com', username: 'admin', password: 'qwerty', password_confirmation: 'qwerty')

  describe 'Validations' do
    it 'is not valid without an email' do
      new_admin.email = nil
      expect(new_admin).not_to be_valid
    end

    it 'is not valid without a username' do
      new_admin.username = nil
      expect(new_admin).not_to be_valid
    end
  end
end
