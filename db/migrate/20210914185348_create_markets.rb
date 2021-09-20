class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|
      t.string :market_symbol
      t.float :curr_price
      t.string :logo_url
      t.timestamps
    end
  end
end
