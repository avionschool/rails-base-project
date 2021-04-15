class CreateBrokerStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :broker_stocks do |t|
      t.integer :user_id
      t.string :ticker
      t.string :company
      t.float :price

      t.timestamps
    end
  end
end
