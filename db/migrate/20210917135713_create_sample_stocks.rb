class CreateSampleStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :sample_stocks do |t|
      t.string :market_symbol
      t.float :curr_price
      t.string :logo_url
      t.timestamps
    end
  end
end