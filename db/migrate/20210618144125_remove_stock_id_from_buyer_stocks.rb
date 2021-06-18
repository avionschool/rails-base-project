class RemoveStockIdFromBuyerStocks < ActiveRecord::Migration[6.0]
  def change
    # remove_reference :buyer_stocks, :stock_id, index: true, foreign_key: true
    remove_column :buyer_stocks, :stock_id
  end
end
