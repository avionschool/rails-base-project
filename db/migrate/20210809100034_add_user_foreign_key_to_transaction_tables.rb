class AddUserForeignKeyToTransactionTables < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :transaction_tables, :users
  end
end
