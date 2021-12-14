class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock_holding, null: false, foreign_key: true
      t.string :transaction_type
      t.string :stock_symbol
      t.float :stock_price
      t.float :units
      t.float :amount
      t.timestamps
    end
  end
end
