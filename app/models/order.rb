class Order < ApplicationRecord
  belongs_to :wallet
  belongs_to :coin

  validates :price, :quantity, :kind, presence:true
  validate :kind_is_buy_or_sell

  def kind_is_buy_or_sell
    if kind == 'buy' or kind == 'sell'
      else 
        errors.add(:kind, "must be buy or sell")
    end
  end
  
end