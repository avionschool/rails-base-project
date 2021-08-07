class CreateTransactionTable < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_tables do |t|
      t.string :transaction_text
      t.string :transction_type

      t.timestamps
    end
  end
end
