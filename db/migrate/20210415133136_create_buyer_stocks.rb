class CreateBuyerStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :buyer_stocks do |t|
      t.integer :user_id
      t.string :ticker
      t.string :company
      t.integer :quantity
      t.float :price
      t.float :total_price

      t.timestamps
    end
  end
end
