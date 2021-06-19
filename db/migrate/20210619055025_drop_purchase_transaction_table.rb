class DropPurchaseTransactionTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :purchase_transactions
  end
end
