class AddBuyerIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :buyer_id, :integer
  end
end
