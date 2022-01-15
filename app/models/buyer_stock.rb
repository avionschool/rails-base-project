class BuyerStock < ApplicationRecord
  belongs_to :buyer
  belongs_to :stock

  def self.check_db(stock_id, buyer_id)
    find_by(stock_id: stock_id, buyer_id: buyer_id)
  end
end
