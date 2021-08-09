class AddUserIdToTransactionTables < ActiveRecord::Migration[6.0]
  def change
    add_reference :transaction_tables, :user, index:true
  end
end
