class CreateBuyerStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_stocks do |t|
      t.references :buyer, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.integer :quantity
      t.float :stock_price
      t.integer :broker_id
      t.timestamps
    end
  end
end

