class AddTransactiondetailsToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :stock_name, :string
    add_column :transactions, :stock_symbol, :string
    add_column :transactions, :current_price, :float
    add_column :transactions, :count_shares, :integer
    add_column :transactions, :total_price, :float
  end
end
