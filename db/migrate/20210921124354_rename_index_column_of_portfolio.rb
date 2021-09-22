class RenameIndexColumnOfPortfolio < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_portfolios, :stocks_id, :stock_id
    rename_column :user_portfolios, :users_id, :user_id
  end
end
