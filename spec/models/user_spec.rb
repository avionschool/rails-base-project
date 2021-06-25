require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.new }

  context 'validations' do
    it 'is not valid without username' do
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:username)  
    end
    it 'is not valid without email' do
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:email)  
    end
    it 'is not valid without password' do
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:password)  
    end
    it 'is not valid without role' do
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:role)  
    end
    it 'is valid if user has the role of buyer' do
      user.role = 'buyer'
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to_not include(:role)  
    end
    it 'is valid if user has the role of broker' do
      user.role = 'broker'
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to_not include(:role)  
    end
    it 'is valid if user has the role of admin' do
      user.role = 'admin'
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to_not include(:role)  
    end
  end
end