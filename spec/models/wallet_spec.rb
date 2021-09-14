require 'rails_helper'

RSpec.describe Wallet, type: :model do
  
  context "validating presence" do
    it "should not be valid without user_id" do
      wallet = Wallet.new
      wallet.user_id = nil
      wallet.running_balance = 1_000

      expect(wallet).to_not be_valid
      expect(wallet.errors).to be_present
      expect(wallet.errors.to_h.keys).to include(:user_id)  
    end

    it "should not be valid without running_balance" do
      wallet = Wallet.new
      wallet.user_id = 1
      wallet.running_balance = nil

      expect(wallet).to_not be_valid
      expect(wallet.errors).to be_present
      expect(wallet.errors.to_h.keys).to include(:running_balance)  
    end
  end

  context "validating values for numerals" do
    it "should not be valid if running balance is NEGATIVE" do
      wallet = Wallet.new
      wallet.user_id = 1
      wallet.running_balance = -1_0000

      expect(wallet).to_not be_valid
      expect(wallet.errors).to be_present
      expect(wallet.errors.to_h.keys).to include(:running_balance)  
    end

    it "should be valid if running balance is ZERO" do
      wallet = Wallet.new
      wallet.user_id = 1
      wallet.running_balance = 0

      expect(wallet).to be_valid
      expect(wallet.errors).to_not be_present
      expect(wallet.errors.to_h.keys).to_not include(:running_balance)  
    end
  end
  
end
