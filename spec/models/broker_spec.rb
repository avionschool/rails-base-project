require 'rails_helper'

RSpec.describe Broker, type: :model do
  let!(:broker) { described_class.create(email: 'e@email.com', password: 'password', password_confirmation: 'password') }

  context 'with validation tests' do
    it 'ensures email presence' do
      broker.email = nil

      expect(broker).not_to be_valid
    end

    it 'ensures password presence' do
      broker.password = nil

      expect(broker).not_to be_valid
    end

    it 'ensures password_confirmation presence' do
      broker.password_confirmation = nil

      expect(broker).not_to be_valid
    end

    it 'must successfully save' do
      expect(broker).to be_valid
    end
  end
end
