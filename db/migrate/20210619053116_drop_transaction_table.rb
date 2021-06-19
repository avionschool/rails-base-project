class DropTransactionTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :transactions
  end
end
