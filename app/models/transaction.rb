class Transaction < ApplicationRecord
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 } 
    validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
    # validates :user_id, presence: false, allow_nil: true

    belongs_to :stock
    # belongs_to :user, optional: true # SELL: broker or seller like IEX
    
    belongs_to :seller, class_name: "User", optional: true # BUY: broker or buyer
    belongs_to :buyer, class_name: "User" # BUY: broker or buyer
end
