require 'rails_helper'

RSpec.describe Buyer, type: :model do
  let!(:buyer) do
    described_class.create(
      email: 'buyer@email.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'is not valid without email' do
    buyer.email = nil

    expect(buyer).not_to be_valid
  end

  it 'is not valid without password' do
    buyer.password = nil

    expect(buyer).not_to be_valid
  end

  it 'Create a buyer account' do
    expect(buyer).to be_valid
  end
end
