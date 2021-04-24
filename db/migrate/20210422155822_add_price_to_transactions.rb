class AddPriceToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :price, :float
  end
end
