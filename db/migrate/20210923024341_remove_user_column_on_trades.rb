class RemoveUserColumnOnTrades < ActiveRecord::Migration[6.0]
  def change
    remove_column :trades, :user_id
  end
end
