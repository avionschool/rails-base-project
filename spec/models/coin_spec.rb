require 'rails_helper'

RSpec.describe Coin, :type => :model do
  let!(:coin) {Coin.new}
  
  context 'When filled' do
    it "fails on missing base and coingecko_id" do
      coin.base = nil
      coin.coingecko_id = nil

      expect(coin.errors).to be_present
    end

    it "is not valid without a base" do
      coin = Coin.new(base: nil, coingecko_id: "decentraland")
      expect(coin).to_not be_valid
    end

    it "is not valid without coingecko_id" do
      coin = Coin.new(base: "MANA", coingecko_id: nil)
      expect(coin).to_not be_valid
    end

    it "is not valid if it is not supported in binance" do
      coin = Coin.new(base: "MANA", coingecko_id: "decentraland")
      expect(coin.errors.to_hash.keys).to include(:base)
    end
  end
end