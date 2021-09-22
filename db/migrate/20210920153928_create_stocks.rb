class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :stock_symbol
      t.integer :current_price
      t.string :logo

      t.timestamps
    end
  end
end
