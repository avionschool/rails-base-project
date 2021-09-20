class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.string :market_symbol
      t.float :hist_price
      t.float :amount
      t.integer :sample_stock_id

      t.timestamps
    end
  end
end
