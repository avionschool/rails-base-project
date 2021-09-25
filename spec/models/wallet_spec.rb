require 'rails_helper'

RSpec.describe Wallet, type: :model do
  context 'with validations' do
    it 'is not valid without id' do
      wallet = described_class.new
      wallet.id = 1
      wallet.deposit = 10
      wallet.withdraw = 5
      wallet.user_id = 4
      wallet.updated_at = Time.current
      wallet.created_at = Time.current

      expect(wallet).to be_valid
    end

    it 'is not valid without updated_at' do
      wallet = described_class.new
      wallet.id = 1
      wallet.deposit = 10
      wallet.withdraw = 5
      wallet.user_id = 1
      wallet.updated_at = nil
      wallet.created_at = Time.current

      expect(wallet).not_to be_valid
    end

    it 'is not valid without created_at' do
      wallet = described_class.new
      wallet.id = 1
      wallet.deposit = 10
      wallet.withdraw = 5
      wallet.user_id = 1
      wallet.updated_at = Time.current
      wallet.created_at = nil

      expect(wallet).not_to be_valid
    end

    it 'is not valid without deposit' do
      wallet = described_class.new
      wallet.id = 1
      wallet.deposit = nil
      wallet.withdraw = 5
      wallet.user_id = 1
      wallet.updated_at = Time.current
      wallet.created_at = Time.current

      expect(wallet).not_to be_valid
    end

    it 'is not valid without withdraw' do
      wallet = described_class.new
      wallet.id = 1
      wallet.deposit = 10
      wallet.withdraw = nil
      wallet.user_id = 1
      wallet.updated_at = Time.current
      wallet.created_at = Time.current

      expect(wallet).not_to be_valid
    end
  end
end
