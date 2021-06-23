require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { described_class.new }
  let(:admin) { UserType.find_by(user_type: 'admin') }
  let(:buyer) { UserType.find_by(user_type: 'buyer') }
  let(:broker) { UserType.find_by(user_type: 'broker') }

  context 'when testing validation' do
    before do
      user.email = 'test@gmail.com'
      user.password = 'password'
      user.password_confirmation = 'password'
      user.first_name = 'Firstname'
      user.last_name = 'Lastname'
      user.user_type_id = buyer.id
      user.verified = true
    end

    it 'ensures there is first name'

    it 'ensures there is last name'

    it 'ensures there is email'

    it 'ensures email is unique'

    it 'ensures there is password'

    it 'ensures there is user type id'

    it 'ensures verified is not nil'

    it 'should save properly'
  end

  context 'when testing scopes' do
    it 'should only get buyers'

    it 'should only get brokers'

    it 'should only get admin'
  end
end
