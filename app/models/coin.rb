require 'httparty'

class Coin < ApplicationRecord
    has_many :orders
    validate :coin_is_listed_in_binance, :target_is_usdt
    validates :target, uniqueness: { scope: :base }

    private

    def coin_is_listed_in_binance
      res = HTTParty.get('https://api.coingecko.com/api/v3/exchanges/binance')
      res["tickers"].each do |coin|
        if coin["base"] == base && coin["target"] == target
          return true
        end
      end
      errors.add(:target, ": coin-pair may not be listed on binance")
    end

    def target_is_usdt
      return true if target == "USDT"
      errors.add(:target, "should be only USDT for now")
    end
end
