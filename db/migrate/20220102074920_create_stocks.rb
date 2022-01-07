class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.decimal :last_price
      t.integer :quantity
      t.float :stock_price
      t.string :logo
      t.integer :added_by

      t.timestamps
    end
  end
end
