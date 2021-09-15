class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|
      t.string :stock
      t.integer :curr_stock_price

      t.timestamps
    end
  end
end
