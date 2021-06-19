class CreateTransacts < ActiveRecord::Migration[6.0]
  def change
    create_table :transacts do |t|
      t.integer :broker_id, null: false, foreign_key: true
      t.integer :buyer_id, null: false, foreign_key: true
      t.integer :stock_id, null: false, foreign_key: true
      t.decimal :quantity
      t.decimal :price
      t.timestamps
    end
  end
end
