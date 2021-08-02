class CreateMyStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :my_stocks do |t|
      t.string :stock_name_bought
      t.integer :stock_count_bought
      t.integer :stock_price_bough

      t.timestamps
    end
  end
end
