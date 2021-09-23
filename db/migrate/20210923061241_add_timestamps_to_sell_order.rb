class AddTimestampsToSellOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :sell_orders, :created_at, :datetime
    add_column :sell_orders, :updated_at, :datetime
  end
end
