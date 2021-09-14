class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.integer :user_id
      t.integer :stock_id
      t.integer :price
      t.integer :quantity
      t.integer :transaction_type

      t.timestamps
    end
  end
end
