class CreatePurchaseTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_transactions do |t|
      t.string :stock_code
      t.decimal :price
      t.integer :volume
      t.decimal :total_value
      t.string :broker_name
      t.string :company_name
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :broker, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
