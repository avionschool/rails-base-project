class ChangingTypeOfStockIdToString < ActiveRecord::Migration[6.0]
  def change
    change_column :brokers_stocks, :stock_id, :string
    change_column :buyers_stocks, :stock_id, :string
  end
end
