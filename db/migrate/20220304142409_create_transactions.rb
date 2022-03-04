class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer "user_id"
      t.integer "portfolio_id"
      t.string "market_symbol"
      t.float "hist_price"
      t.float "amount"
      t.float "units"
      t.string "transaction_type"
      t.datetime "transaction_date"
      
      t.timestamps
    end
  end
end
