require 'rails_helper'

RSpec.describe Admin, type: :model do
  let!(:admin) { described_class.create(email: 'e@email.com', password: 'password', password_confirmation: 'password') }

  context 'with validation tests' do
    it 'ensures email presence' do
      admin.email = nil

      expect(admin).not_to be_valid
    end

    it 'ensures password presence' do
      admin.password = nil

      expect(admin).not_to be_valid
    end

    it 'ensures password_confirmation presence' do
      admin.password_confirmation = nil

      expect(admin).not_to be_valid
    end

    it 'must successfully save' do
      expect(admin).to be_valid
    end
  end
end
