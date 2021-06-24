require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { described_class.new }
  let(:user2) { described_class.new }
  let(:admin) { UserType.find_or_create_by(user_type: 'admin') }
  let(:buyer) { UserType.find_or_create_by(user_type: 'buyer') }
  let(:broker) { UserType.find_or_create_by(user_type: 'broker') }

  context 'when testing validation' do
    before do
      user.email = 'test@gmail.com'
      user.password = 'password'
      user.password_confirmation = 'password'
      user.first_name = 'Firstname'
      user.last_name = 'Lastname'
      user.user_type_id = buyer.id
      user.verified = true

      user2.email = 'test2@gmail.com'
      user2.password = 'password'
      user2.password_confirmation = 'password'
      user2.first_name = 'Firstname2'
      user2.last_name = 'Lastname2'
      user2.user_type_id = buyer.id
      user2.verified = true
    end

    it 'ensures there is first name' do
      user.first_name = nil
      user.valid?

      expect(user.errors.to_h.keys).to include(:first_name)
    end

    it 'ensures there is last name' do
      user.last_name = nil
      user.valid?

      expect(user.errors.to_h.keys).to include(:last_name)
    end

    it 'ensures there is email' do
      user.email = nil
      user.valid?

      expect(user.errors.to_h.keys).to include(:email)
    end

    it 'ensures email is unique' do
      user.save
      user2.email = user.email
      user2.valid?

      expect(user2.errors.to_h.keys).to include(:email)
    end

    it 'ensures there is password' do
      user.password = nil
      user.password_confirmation = user.password
      user.valid?

      expect(user.errors.to_h.keys).to include(:password)
    end

    it 'ensures there is password confirmation' do
      user.password_confirmation = nil
      user.valid?

      expect(user.errors.to_h.keys).to include(:password_confirmation)
    end

    it 'ensures password and password confirmation matches' do
      user.password_confirmation = 'wrong_password'
      user.valid?

      expect(user.errors.to_h.keys).to include(:password_confirmation)
    end

    it 'ensures there is user type id' do
      user.user_type_id = nil
      user.valid?

      expect(user.errors.to_h.keys).to include(:user_type_id)
    end

    it 'ensures verified is not nil'

    it 'should save properly'
  end

  context 'when testing scopes' do
    it 'should only get buyers'

    it 'should only get brokers'

    it 'should only get admin'
  end

  context 'when new user is a broker' do
    it 'should set broker verified as false'
  end

  context 'when new user is a buyer or admin' do
    it 'should set buyer verified as true'

    it 'should set admin verified as true'
  end
end
