class RenameIndexColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :buy_orders, :stocks_id, :stock_id
    rename_column :buy_orders, :users_id, :user_id
    rename_column :sell_orders, :stocks_id, :stock_id
    rename_column :sell_orders, :users_id, :user_id
  end
end
