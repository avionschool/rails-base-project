class ChangeMarketTableColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :markets, :stock, :market_symbol
    rename_column :markets, :curr_stock_price, :curr_price
  end
end
