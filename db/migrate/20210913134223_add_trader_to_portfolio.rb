class AddTraderToPortfolio < ActiveRecord::Migration[6.0]
  def change
    add_reference :portfolios, :trader, null: false, foreign_key: true
  end
end
