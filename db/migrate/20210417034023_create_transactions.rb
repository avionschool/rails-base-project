class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :stock_id
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
