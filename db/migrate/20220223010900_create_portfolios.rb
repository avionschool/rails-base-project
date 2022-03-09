class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.string :market_symbol
      t.float :hist_price
      t.float :amount
      t.integer :market_id
      t.float :units
      t.string :transaction_type
      t.timestamps
    end
  end
end
