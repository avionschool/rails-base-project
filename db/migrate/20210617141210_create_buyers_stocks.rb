class CreateBuyersStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers_stocks do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :stock_id, null: false, foreign_key: true
      t.string :name
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
