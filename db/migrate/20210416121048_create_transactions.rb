class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user
      t.references :buyersstocks
      t.date :transactions_date
      t.boolean :status

      t.timestamps
    end
  end
end
