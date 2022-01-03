class AddTypeToStockHoldings < ActiveRecord::Migration[6.0]
  def change
    add_column :stock_holdings, :type, :string
  end
end
