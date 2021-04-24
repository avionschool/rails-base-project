class AddBrokerIdToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :broker_id, :integer
  end    
  remove_column(:transactions, :stock_id)
end
