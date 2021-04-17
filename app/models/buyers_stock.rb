class BuyersStock < ApplicationRecord
    def self.find_entry(user_id,stock_id)
        self.where(stock_id: stock_id).find_by(user_id: user_id)
    end

    def self.exists?(user_id,stock_id)
        !!self.find_entry(user_id,stock_id)
    end

    def self.volume_of(user_id,stock_id)
        self.find_entry(user_id,stock_id).volume
    end

end
