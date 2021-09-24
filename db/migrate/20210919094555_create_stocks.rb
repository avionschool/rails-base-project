class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :ticker, null: false
      t.string :company_name
      t.float :stock_price, default: 0.00, scale: 2
      t.timestamps
    end
  end
end
