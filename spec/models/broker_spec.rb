require 'rails_helper'

RSpec.describe Broker, type: :model do
  let!(:broker) do
    described_class.create(
      email: 'broker@email.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'is not valid without email' do
    broker.email = nil
    expect(broker).not_to be_valid
  end

  it 'is not valid without password' do
    broker.password = nil

    expect(broker).not_to be_valid
  end

  it 'Create a broker account' do
    expect(broker).to be_valid
  end
end
