class ChangeStatusToInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :buy_orders, :status
    remove_column :sell_orders, :status
    add_column :buy_orders, :status, :integer, null: false, default: 0
    add_column :sell_orders, :status, :integer, null: false, default: 0
  end
end
