class RemoveIndexToTrades < ActiveRecord::Migration[6.0]
  def change
    remove_index :trades, name: "index_trades_on_buy_order_id"
  end
end
