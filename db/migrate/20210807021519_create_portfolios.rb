class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :stock_name
      t.string :stock_symbol
      t.integer :total_shares
      t.float :average_buy_price

      t.timestamps
    end
  end
end
