class AddBrokerageFeeTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactionrecords, :brokerage_fee, :decimal
  end
end
