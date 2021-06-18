class ChangeBrokerStockIdToStockId < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :broker_stock_id, :stock_id
  end
end
