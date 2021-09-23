class RenameTradeColumnReferences < ActiveRecord::Migration[6.0]
  def change
    rename_column :trades, :buy_orders_id, :buy_order_id
    rename_column :trades, :sell_orders_id, :sell_order_id
    change_column_null :trades, :sell_order_id, true 
  end
end
