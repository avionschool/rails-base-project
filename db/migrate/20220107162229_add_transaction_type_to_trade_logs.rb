class AddTransactionTypeToTradeLogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :trade_logs, :accounts_id
    add_column :trade_logs, :transaction_type, :string
  end
end
