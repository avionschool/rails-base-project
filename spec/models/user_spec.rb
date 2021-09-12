require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  context 'validation' do

      it 'is not valid without the email address' do
      user = User.new
      #user.email = 'mumble@gmail.com'
      user.username = 'mumble-07'
      user.full_name = 'Andy Lang'
      user.password = 'this_is_my_password'
      
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:email)
    end

    it 'is not valid without the user name' do
      user = User.new
      user.email = 'mumble@gmail.com'
      #user.username = nil
      user.full_name = 'Andy Lang'
      user.password = 'this_is_my_password'
      
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:username)
    end

    it 'is not valid without the full name' do
      user = User.new
      user.email = 'mumble@gmail.com'
      user.username = nil
      #user.full_name = 'Andy Lang'
      user.password = 'this_is_my_password'
      
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:full_name)
    end

    it 'is not valid without the password' do
      user = User.new
      user.email = 'mumble@gmail.com'
      user.username = nil
      user.full_name = 'Andy Lang'
      #user.password = 'this_is_my_password'
      
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:password)
    end
  
  end
end