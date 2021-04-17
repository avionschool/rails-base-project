class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :price

      t.timestamps

      t.references :stock
      t.references :user
    end
  end
end
