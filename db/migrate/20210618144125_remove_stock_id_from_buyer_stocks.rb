class RemoveStockIdFromBuyerStocks < ActiveRecord::Migration[6.0]
  def change
    remove_column :buyer_stocks, :stock_id
  end
end
