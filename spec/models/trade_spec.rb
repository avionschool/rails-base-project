require 'rails_helper'

RSpec.describe Trade, type: :model do

  context 'validating presence' do
    it "is not valid without user_id" do
      trade = Trade.new
      trade.user_id = nil
      trade.stock_id = 1
      trade.price = 10
      trade.quantity = 10
      trade.transaction_type = "buy"

      expect(trade).to_not be_valid
      expect(trade.errors).to be_present
      expect(trade.errors.to_h.keys).to include(:user_id)
    end

    it "is not valid without stock_id" do
      trade = Trade.new
      trade.user_id = 1
      trade.stock_id = nil
      trade.price = 10
      trade.quantity = 10
      trade.transaction_type = "buy"

      expect(trade).to_not be_valid
      expect(trade.errors).to be_present
      expect(trade.errors.to_h.keys).to include(:stock_id)
    end

    it "is not valid without price" do
      trade = Trade.new
      trade.user_id = 1
      trade.stock_id = 1
      trade.price = nil
      trade.quantity = 10
      trade.transaction_type = "buy"

      expect(trade).to_not be_valid
      expect(trade.errors).to be_present
      expect(trade.errors.to_h.keys).to include(:price)
    end

    it "is not valid without quantity" do
      trade = Trade.new
      trade.user_id = 1
      trade.stock_id = 1
      trade.price = 10
      trade.quantity = nil
      trade.transaction_type = "buy"

      expect(trade).to_not be_valid
      expect(trade.errors).to be_present
      expect(trade.errors.to_h.keys).to include(:quantity)
    end

    it "is not valid without transaction_type" do
      trade = Trade.new
      trade.user_id = 1
      trade.stock_id = 1
      trade.price = 10
      trade.quantity = 10
      trade.transaction_type = nil

      expect(trade).to_not be_valid
      expect(trade.errors).to be_present
      expect(trade.errors.to_h.keys).to include(:transaction_type)
    end
  end 


  context "validating acceptable values for numerals" do

    it "should not be valid if price is zero or negative" do
      trade = Trade.new
      trade.user_id = 1
      trade.stock_id = 1
      trade.price = 0
      trade.quantity = 10
      trade.transaction_type = "buy"

      expect(trade).to_not be_valid
      expect(trade.errors).to be_present
      expect(trade.errors.to_h.keys).to include(:price)
    end

    it "should not be valid if quantity is zero or negative" do
      trade = Trade.new
      trade.user_id = 1
      trade.stock_id = 1
      trade.price = 10
      trade.quantity = 0
      trade.transaction_type = "buy"

      expect(trade).to_not be_valid
      expect(trade.errors).to be_present
      expect(trade.errors.to_h.keys).to include(:quantity)
    end
  end

  context "validating enum for transaction_type" do
    it "should define enum for transaction_types" do
      should define_enum_for(:transaction_type).with_values( buy: 0, sell: 1 )
    end

    it "should not save if enum value is not buy or sell" do
      expect {
        trade = Trade.new
        trade.user_id = 1
        trade.stock_id = 1
        trade.price = 10
        trade.quantity = 10
        trade.transaction_type = "notBuyorSell"
      }.to raise_error(ArgumentError)
    end
  end
end
