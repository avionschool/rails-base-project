class RenameCoinInPortfolio < ActiveRecord::Migration[6.0]
  def change
    rename_column :portfolios, :coin, :symbol
  end
end
