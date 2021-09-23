class CreateSellOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :sell_orders do |t|
      t.string :indicator
      t.float :quantity
      t.float :price
      t.float :total_amount
      t.string :status
      t.references :users, null: false, foreign_key: true
      t.references :stocks, null: false, foreign_key: true
    end
  end
end
