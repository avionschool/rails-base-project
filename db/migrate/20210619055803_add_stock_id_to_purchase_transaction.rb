class AddStockIdToPurchaseTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_transactions, :stock_id, :integer
  end
end
