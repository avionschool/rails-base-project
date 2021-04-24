class BuyerStock < ApplicationRecord
    belongs_to :user

    before_save :compute_total_price

    def compute_total_price
       self.total_price =  (self.quantity * self.price).round(2)
    end
end
