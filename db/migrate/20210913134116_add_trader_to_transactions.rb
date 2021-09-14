class AddTraderToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :trader, null: false, foreign_key: true
  end
end
