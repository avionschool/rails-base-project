class AddBackIndexToTrades < ActiveRecord::Migration[6.0]
  def change
    add_index :trades, :buy_order_id
  end
end
