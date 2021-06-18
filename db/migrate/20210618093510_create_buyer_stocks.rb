class CreateBuyerStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.decimal :price
      t.integer :quantity
      t.string :broker_email

      t.timestamps
    end
  end
end
