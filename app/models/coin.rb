require 'httparty'

class Coin < ApplicationRecord
    has_many :orders
    validate :coin_is_listed_in_binance, on: :create
    validates :base, uniqueness: { scope: :target }
    private

    def coin_is_listed_in_binance
      res = HTTParty.get('https://api.coingecko.com/api/v3/exchanges/binance')
      res["tickers"].each do |coin|
        return true if coin["base"] == self.base && coin["target"] == self.target
      end
      errors.add(:target, ": coin-pair may not be listed on binance")
    end
end
