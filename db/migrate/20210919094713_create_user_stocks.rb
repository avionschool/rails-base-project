class CreateUserStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_stocks do |t|
      t.integer :user_id
      t.integer :stock_id
      t.string :ticker
      t.string :company_name
      t.float :price, default: 0.00, scale: 2
      t.float :total_price, default: 0.00, scale: 2
      t.integer :quantity
      t.timestamps
    end
  end
end
