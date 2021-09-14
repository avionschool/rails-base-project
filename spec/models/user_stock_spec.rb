require 'rails_helper'

RSpec.describe UserStock, type: :model do
  
  context "validating presence" do
    it "should not be valid without user_id" do
      user_stock = UserStock.new
      user_stock.user_id = nil
      user_stock.stock_id = 1
      user_stock.quantity = 10

      expect(user_stock).to_not be_valid
      expect(user_stock.errors).to be_present
      expect(user_stock.errors.to_h.keys).to include(:user_id)  
    end

    it "should not be valid without stock_id" do
      user_stock = UserStock.new
      user_stock.user_id = 1
      user_stock.stock_id = nil
      user_stock.quantity = 10

      expect(user_stock).to_not be_valid
      expect(user_stock.errors).to be_present
      expect(user_stock.errors.to_h.keys).to include(:stock_id)  
    end

    it "should not be valid without quantity" do
      user_stock = UserStock.new
      user_stock.user_id = 1
      user_stock.stock_id = 1
      user_stock.quantity = nil

      expect(user_stock).to_not be_valid
      expect(user_stock.errors).to be_present
      expect(user_stock.errors.to_h.keys).to include(:quantity)  
    end
  end


  context "validating values for numerals" do
    it "should not be valid if quantity is below zero" do
      user_stock = UserStock.new
      user_stock.user_id = 1
      user_stock.stock_id = 1
      user_stock.quantity = -10

      expect(user_stock).to_not be_valid
      expect(user_stock.errors).to be_present
      expect(user_stock.errors.to_h.keys).to include(:quantity)  
    end

    it "should be valid if quantity is zero" do
      user_stock = UserStock.new
      user_stock.user_id = 1
      user_stock.stock_id = 1
      user_stock.quantity = 0

      expect(user_stock).to be_valid
      expect(user_stock.errors).to_not be_present
      expect(user_stock.errors.to_h.keys).to_not include(:quantity)  
    end
  end
  
end
