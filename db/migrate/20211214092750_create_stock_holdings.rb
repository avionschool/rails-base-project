class CreateStockHoldings < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_holdings do |t|
      t.string :stock_symbol
      t.float :stock_price
      t.float :amount
      t.float :units
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.timestamps
    end
  end
end
