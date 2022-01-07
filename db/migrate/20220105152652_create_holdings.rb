class CreateHoldings < ActiveRecord::Migration[6.0]
  def change
    create_table :holdings do |t|
      t.integer :user_id
      t.string :ticker
      t.float :log_price
      t.float :amount
      t.integer :stock_id
      t.string :transaction_type

      t.timestamps
    end
  end
end
