require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { described_class.new }

  it 'must have a valid email' do
    user.email = 'invalidemail'
    user.password = 'password'
    user.fullname = 'John Stonks'
    expect(user).not_to be_valid
    # user.email = 'user@example.com'
    # expect(user).to be_valid
  end

  it 'must have a password' do
    user.email = 'user@example.com'
    user.password = nil
    user.fullname = 'John Stonks'
    expect(user).not_to be_valid
    # user.password = 'password'
    # expect(user).to be_valid
  end

  it 'must have a default approved of false' do
    user.email = 'user@example.com'
    user.password = 'password'
    user.fullname = 'John Stonks'
    expect(user.approved).to eq(false)
  end

  it 'fullname cannot be blank' do
    user.email = 'user@example.com'
    user.password = 'password'
    user.fullname = nil
    expect(user).not_to be_valid
    # user.fullname = 'John Stonks'
    # expect(user).to be_valid
  end
end
