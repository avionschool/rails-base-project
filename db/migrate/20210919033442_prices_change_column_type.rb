class PricesChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    remove_column :stocks, :prices
    add_column :stocks, :prices, :jsonb
  end
end
