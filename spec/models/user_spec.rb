require 'rails_helper'

RSpec.describe User, type: :model do

context 'When user signing in check validations' do

  it 'is not valid without the email address' do
    user = User.new
    user.email = nil
    user.username = 'mumble-07'
    user.full_name = 'Andy Lang'
    user.password = 'this_is_my_password'
    
    expect(user).not_to be_valid
  end

  it 'is not valid without the user name' do
    user = User.new
    user.email = 'mumble@gmail.com'
    user.username = nil
    user.full_name = 'Andy Lang'
    user.password = 'this_is_my_password'
    
    expect(user).not_to be_valid
  end

  it 'is not valid without the full name' do
    user = User.new
    user.email = 'mumble@gmail.com'
    user.username = nil
    user.full_name = nil
    user.password = 'this_is_my_password'
    
    expect(user).not_to be_valid
  end

  it 'is not valid without the password' do
    user = User.new
    user.email = 'mumble@gmail.com'
    user.username = nil
    user.full_name = 'Andy Lang'
    user.password = nil
    
    expect(user).not_to be_valid
  end
end
end