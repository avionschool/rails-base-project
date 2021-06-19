class CreateBrokerStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :broker_stocks do |t|
      t.integer :user_id
      t.integer :stock_id
      t.string :company
      t.float :price
      t.string :ticker
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
