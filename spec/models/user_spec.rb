require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when testing validation' do
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
