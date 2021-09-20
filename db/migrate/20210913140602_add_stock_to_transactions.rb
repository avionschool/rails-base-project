class AddStockToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :stock, null: false, foreign_key: true
  end
end
