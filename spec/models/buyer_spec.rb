require 'rails_helper'

RSpec.describe Buyer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context 'with validations / fail to save' do
    it 'is not valid without email' do
      buyer = described_class.new(email: nil, first_name: 'Light', last_name: 'Yagami', username: 'Kira', password: 'passwordBuyer', password_confirmation: 'passwordBuyer')
      buyer.save
      # expect(buyer).not_to be_valid
      expect(buyer.errors.to_h.keys).to include(:email)
    end

    it 'is not valid without password' do
      buyer = described_class.new(email: 'e@email.com', first_name: 'Light', last_name: 'Yagami', username: 'Kira', password: nil, password_confirmation: 'passwordBuyer')
      buyer.save
      # expect(buyer).not_to be_valid
      expect(buyer.errors.to_h.keys).to include(:password)
    end

    it 'is not valid without password confimation' do
      buyer = described_class.new(email: 'e@email.com', first_name: 'Light', last_name: 'Yagami', username: 'Kira', password: 'passwordBuyer', password_confirmation: nil)
      buyer.save
      # expect(buyer).not_to be_valid
      expect(buyer.errors.to_h.keys).to include(:password_confirmation)
    end
  end

  context 'with validations / should save' do
    it 'is valid' do
      buyer = described_class.new(email: 'e@email.com', first_name: 'Light', last_name: 'Yagami', username: 'Kira', password: 'passwordBuyer', password_confirmation: 'passwordBuyer')
      buyer.save
      # expect(buyer).to be_valid
      expect(buyer.errors.to_h.keys).not_to include(%i[email password])
    end
  end
end
