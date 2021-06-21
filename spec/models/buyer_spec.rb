require 'rails_helper'

RSpec.describe Buyer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let!(:buyer) { described_class.new }

  context 'with validations / fail to save' do
    it 'is not valid without email' do
      buyer.email = nil
      buyer.password = 'password buyer'
      buyer.password_confirmation = 'password buyer'
      buyer.save

      # expect(buyer).not_to be_valid
      expect(buyer.errors.to_h.keys).to include(:email)
    end

    it 'is not valid without password' do
      buyer.email = 'e@email.com'
      buyer.password = nil
      buyer.password_confirmation = 'password'
      buyer.save

      # expect(buyer).not_to be_valid
      expect(buyer.errors.to_h.keys).to include(:password)
    end

    it 'is not valid without password confimation' do
      buyer.email = 'e@email.com'
      buyer.password = 'password'
      buyer.password_confirmation = nil
      buyer.save

      # expect(buyer).not_to be_valid
      expect(buyer.errors.to_h.keys).to include(:password_confirmation)
    end
  end

  context 'with validations / should save' do
    it 'is valid' do
      buyer.email = 'e@email.com'
      buyer.password = 'password buyer'
      buyer.password_confirmation = 'password buyer'
      buyer.save

      # expect(buyer).to be_valid
      expect(buyer.errors.to_h.keys).not_to include(%i[email password])
    end
  end
end
