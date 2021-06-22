class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :broker_stock, null: false, foreign_key: true
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
