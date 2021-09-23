class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.integer :user_id
      t.string :stock_code, foreign_key: true
      t.float :price
      t.integer :quantity
      t.integer :transaction_type

      t.timestamps
    end
  end
end
