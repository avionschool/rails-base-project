class RemoveIndexOnTrades < ActiveRecord::Migration[6.0]
  def change
    remove_index :trades, :user_id
  end
end
