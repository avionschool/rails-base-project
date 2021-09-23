class CreateUserPortfolio < ActiveRecord::Migration[6.0]
  def change
    create_table :user_portfolios do |t|
      t.float :quantity
      t.float :price
      t.float :total_amount
      t.float :unrealized
      t.references :users, null: false, foreign_key: true
      t.references :stocks, null: false, foreign_key: true
    end
  end
end
