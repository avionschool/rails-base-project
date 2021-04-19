class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :price
      t.decimal :total_amount
      t.integer :quantity

      t.timestamps

      t.references :stock
      t.references :user
    end
  end
end
