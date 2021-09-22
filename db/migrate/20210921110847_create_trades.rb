class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.integer :shares
      t.float :price
      t.references :buy_orders, null: false, foreign_key: true
      t.references :sell_orders, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
