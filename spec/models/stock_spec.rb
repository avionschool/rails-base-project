require 'rails_helper'

RSpec.describe Stock, type: :model do
  
  context "validating presence" do
    
    it "should not be valid without code" do
      stock = Stock.new
      stock.code = nil
      stock.name = "Apple"
      stock.current_price = 10

      expect(stock).to_not be_valid
      expect(stock.errors).to be_present
      expect(stock.errors.to_h.keys).to include(:code)
    end

    it "should not be valid without name" do
      stock = Stock.new
      stock.code = "AAPL"
      stock.name = nil
      stock.current_price = 10

      expect(stock).to_not be_valid
      expect(stock.errors).to be_present
      expect(stock.errors.to_h.keys).to include(:name)
    end

    it "should not be valid without curent_price" do
      stock = Stock.new
      stock.code = "AAPL"
      stock.name = "Apple"
      stock.current_price = nil

      expect(stock).to_not be_valid
      expect(stock.errors).to be_present
      expect(stock.errors.to_h.keys).to include(:current_price)
    end
  end

  context "validating acceptable values for numerals" do
    it "should not be valid if current_price is zero or less" do
      stock = Stock.new
      stock.code = "AAPL"
      stock.name = "Apple"
      stock.current_price = 0

      expect(stock).to_not be_valid
      expect(stock.errors).to be_present
      expect(stock.errors.to_h.keys).to include(:current_price)
    end
  end
  
end
