require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    # Email Validations
    before do
      described_class.create(email: 'test@gmail.com', password: '123456')
      Role.create(name: 'Buyer')
    end

    it { expect(described_class.new).to validate_presence_of :email }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it { is_expected.to allow_value('email@address.com').for(:email) }
    it { is_expected.to allow_value('email@address').for(:email) }
    it { is_expected.not_to allow_value('email@.com').for(:email) }
    it { is_expected.not_to allow_value('email@addrs.').for(:email) }

    context 'when the email is taken' do
      it 'does not save the duplicate' do
        user1 = FactoryBot.build(:user)
        user2 = FactoryBot.build(:user)
        user1.save
        expect(user2.save).to be_falsy
      end
    end
    # Password Validation

    it { expect(described_class.new).to validate_presence_of :encrypted_password }
  end

  describe 'instance methods' do
    before do
      Stock.create(name: 'TEST STOCK', code: 'TEST', volume: 0)
      Role.create(name: 'Buyer')
      described_class.create(email: 'buyer@gmail.com', password: '123456', role_id: Role.find_by(name: 'Buyer').id)
      described_class.create(email: 'seller@gmail.com', password: '123456', role_id: Role.find_by(name: 'Buyer').id)
      described_class.find_by(email: 'buyer@gmail.com').update(cash: 5000)
      described_class.find_by(email: 'seller@gmail.com').update(cash: 5000)
    end
    # describe buy_stock

    it 'buy_stock should buy stock properly' do
      expect(described_class.find_by(email: 'buyer@gmail.com').buy_stock('TEST', 10, 1)).to be true
      byebug
    end

    it 'buy_stock should not buy stock when not enough cash' do
      expect(described_class.find_by(email: 'buyer@gmail.com').buy_stock('TEST', 1000, 45)).to be false
    end
    # describe sell_stock
    # describe process_transaction
  end
end
