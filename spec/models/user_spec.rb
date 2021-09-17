require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'test@sample.com', username: 'testsss') }
  before { user.save }

  # before(:each) do
  #   @user = User.create!(email: 'test@sample.com', username: 'testsss')
  # end

  context 'validation' do 
    it 'is not valid without username' do
      user.username = nil
      expect(user).not_to be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:username)
    end

    it 'is not valid without firstname' do
      user.firstname = nil
      expect(user).not_to be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:firstname)
    end

    it 'is not valid without lastname' do
      user.lastname = nil
      expect(user).not_to be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:lastname)
    end

    it 'is not valid without email' do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:email)
    end

    it 'is not valid without password' do
      user.password = nil
      expect(user).not_to be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:password)
    end
  end

  context 'username uniqueness' do
    let(:user1) { User.new(email: 'test@sample.com', username: 'testsss') }

    it { expect(user1).to_not be_valid }
  end

  context 'email uniqueness' do
    let(:user1) { User.new(email: 'test@sample.com', username: 'testsss') }

    it { expect(user1).to_not be_valid }
  end

  describe "length validations" do
    it 'should not allow a firstname longer than 20 character' do
      user.firstname = "test" * 200
      expect(user).to_not be_valid
    end
  end

  it 'is valid if user has the role of trader' do
    user.username = 'testsss'
    user.firstname = 'test'
    user.lastname = 'test'
    user.email = 'test@sample.com'
    user.password = '123456'
    user.role = 1
    user.status = 0
    expect(user).to be_valid
  end

  it 'is valid if user has the role of admin' do
    user.username = 'testsss'
    user.firstname = 'test'
    user.lastname = 'test'
    user.email = 'test@sample.com'
    user.password = '123456'
    user.role = 0
    user.status = 1
    expect(user).to be_valid
  end

end