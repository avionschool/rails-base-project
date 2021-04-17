class EditTransactionsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :transactions, :type
    change_table :transactions do |t|
      t.string :transaction_type, null: false
    end
  end
end
