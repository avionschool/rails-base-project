class CreateTradeLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :trade_logs do |t|
      t.integer :user_id
      t.integer :accounts_id
      t.string :ticker
      t.float :amount
      t.float :units
      t.float :log_stock_price
      t.datetime :transaction_date

      t.timestamps
    end
  end
end
