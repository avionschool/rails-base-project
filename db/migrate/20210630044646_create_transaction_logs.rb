class CreateTransactionLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_logs do |t|
      t.references :transaction, null: false, foreign_key: true
      t.integer :amount_change
      t.timestamps
    end
  end
end
