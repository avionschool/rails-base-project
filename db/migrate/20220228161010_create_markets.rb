class CreateMarkets < ActiveRecord::Migration[6.1]
  def change
    create_table :markets do |t|
      t.string :market_symbol
      t.string :name
      t.float :curr_price

      t.timestamps
    end
  end
end
