class Transaction < ApplicationRecord
    TYPES =  ['Buy','Sell'].freeze
    belongs_to :user
    belongs_to :stock
    before_save :check_stock_total

    validates :transaction_type, inclusion: {in: TYPES}
    validates :volume, numericality: {greater_than_or_equal_to: 0}
    validates :price, numericality: {greater_than_or_equal_to: 0}

    scope :available_listings, -> {where(fulfilled: false)}
    scope :sell_listings, -> {available_listings.where("type = 'Sell'")}
    scope :buy_listings, -> {available_listings.where("type = 'Buy'")}
    
    def cancel_transaction
        #Behavior: return alloted_cash/alloted_volume to user => destroy transaction
        if self.transaction_type == 'Buy'
            # Return alloted_cash to cash
            self.user.alloted_cash = self.user.alloted_cash - self.price*self.volume
            self.user.cash = self.user.cash + self.price*self.volume
            if self.user.save
                self.destroy
            else
                "Something went wrong!"
            end

        elsif self.transaction_type == 'Sell'
            bs = BuyersStock.find_entry(self.user.id, self.stock.id)
            bs.alloted_volume = bs.alloted_volume - self.volume
            bs.volume = bs.volume + self.volume
            if bs.save
                self.destroy
            else
                "Something went wrong!"
            end
        end
    end
    
    def check_stock_total
        self.stock.check_total
    end

end
