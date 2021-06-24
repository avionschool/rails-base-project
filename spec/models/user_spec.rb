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

    it 'ensures the user type of the user exists' do
      user.user_type_id = 69_420
      user.valid?

      expect(user.errors.to_h.keys).to include(:user_type)
    end

    it 'ensures verified is not nil' do
      user.verified = nil
      user.valid?

      expect(user.errors.to_h.keys).to include(:verified)
    end

    it 'saves properly' do
      user.save

      expect(user).to be_valid
    end
  end

  context 'when testing scopes' do
    before do
      admin_user = described_class.new
      admin_user.email = 'admin@gmail.com'
      admin_user.password = 'password'
      admin_user.password_confirmation = 'password'
      admin_user.first_name = 'Admin'
      admin_user.last_name = 'Adminson'
      admin_user.user_type_id = admin.id
      admin_user.verified = true
      admin_user.save

      broker_user = described_class.new
      broker_user.email = 'broker@gmail.com'
      broker_user.password = 'password'
      broker_user.password_confirmation = 'password'
      broker_user.first_name = 'Broker'
      broker_user.last_name = 'Brokerson'
      broker_user.user_type_id = broker.id
      broker_user.verified = false
      broker_user.save

      buyer_user = described_class.new
      buyer_user.email = 'buyer@gmail.com'
      buyer_user.password = 'password'
      buyer_user.password_confirmation = 'password'
      buyer_user.first_name = 'Buyer'
      buyer_user.last_name = 'Buyerson'
      buyer_user.user_type_id = buyer.id
      buyer_user.verified = true
      buyer_user.save
    end

    it 'only gets buyers' do
      expect(described_class.buyers.size).to eq(1)
    end

    it 'only gets brokers' do
      expect(described_class.brokers.size).to eq(1)
    end

    it 'only gets admin' do
      expect(described_class.admins.size).to eq(1)
    end
  end

  context 'when testing verified default values' do
    before do
      user.email = 'test@gmail.com'
      user.password = 'password'
      user.password_confirmation = 'password'
      user.first_name = 'Firstname'
      user.last_name = 'Lastname'
      user.user_type_id = nil
      user.verified = nil
    end

    context 'when new user is a broker' do
      it 'sets broker verified as false' do
        user.user_type_id = broker.id
        user.save

        expect(user.verified).to eq(false)
      end
    end

    context 'when new user is a buyer or admin' do
      it 'sets buyer verified as true'

      it 'sets admin verified as true'
    end
  end
end
