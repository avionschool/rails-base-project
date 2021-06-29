require 'rails_helper'

RSpec.describe Broker, type: :model do
  let!(:broker) { described_class.create(email: 'e@email.com', first_name: 'Light', last_name: 'Yagami', username: 'Kira', password: 'passwordBuyer', password_confirmation: 'passwordBuyer') }

  context 'with validation tests' do
    it 'ensures email presence' do
      broker.email = nil

      expect(broker).not_to be_valid
    end

    it 'ensures password presence' do
      broker.password = nil

      expect(broker).not_to be_valid
    end

    it 'must successfully save' do
      expect(broker).to be_valid
    end
  end
end
