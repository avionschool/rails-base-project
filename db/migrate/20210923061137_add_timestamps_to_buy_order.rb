class AddTimestampsToBuyOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :buy_orders, :created_at, :datetime
    add_column :buy_orders, :updated_at, :datetime
  end
end
