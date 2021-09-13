class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.decimal :price
      t.integer :qty

      t.timestamps
    end
  end
end
