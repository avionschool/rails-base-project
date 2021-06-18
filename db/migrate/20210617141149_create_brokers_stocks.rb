class CreateBrokersStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :brokers_stocks do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :stock_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
