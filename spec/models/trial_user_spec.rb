require 'rails_helper'

RSpec.describe 'User', type: :model do
  it 'is not valid without first_name' do
    user = User.new(email: 'steven@gmail.com', username: 'stvn', first_name: nil, last_name: 'choy', password: 'test_password')
    expect(user).not_to be_valid
  end

  it 'is not valid without email' do
    user = User.new(email: nil, username: 'stvn', first_name: 'steven', last_name: 'choy', password: 'test_password')
    expect(user).not_to be_valid
  end

  it 'is not valid without username' do
    user = User.new(email: 'steven@gmail.com', username: nil, first_name: 'steven', last_name: 'choy', password: 'test_password')
    expect(user).not_to be_valid
  end

  it 'is not valid without password' do
    user = User.new(email: 'steven@gmail.com', username: 'stvn', first_name: 'steven', last_name: 'choy', password: nil)
    expect(user).not_to be_valid
  end
end
