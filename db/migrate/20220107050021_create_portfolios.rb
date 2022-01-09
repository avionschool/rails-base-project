class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :coin
      t.decimal :amount
      t.references :wallet
      t.references :coin
      t.timestamps
    end
  end
end
