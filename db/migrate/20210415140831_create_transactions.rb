class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :stock_id
      t.string :ticker
      t.integer :quantity
      t.float :total_price

      t.timestamps
    end
  end
end
