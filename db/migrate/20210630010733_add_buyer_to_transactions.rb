class AddBuyerToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :buyer, :string
  end
end
