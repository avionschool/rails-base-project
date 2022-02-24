require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { described_class.new }

  it '1. email must be valid' do
    user.fullname = 'Stonks'
    user.email = 'stonks'
    user.password = 'password'

    expect(user).not_to be_valid
  end

  it '2. must have a password' do
    user.fullname = 'Stonks'
    user.email = 'stonks@gmail.com'
    user.password = nil

    expect(user).not_to be_valid
  end

  it '3. approved must be false on creation' do
    user.fullname = 'Stonks'
    user.email = 'stonks@gmail.com'
    user.password = 'password'

    expect(user.approved).to eq(false)
  end

  it '4. fullname must be valid' do
    user.fullname = nil
    user.email = 'stonkers@gmail.com'
    user.password = 'password'

    expect(user).not_to be_valid
  end
end
