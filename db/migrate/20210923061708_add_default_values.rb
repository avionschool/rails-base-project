class AddDefaultValues < ActiveRecord::Migration[6.0]
  def change
    change_column :buy_orders, :indicator, :type, :default => 'BID'
    change_column :sell_orders, :indicator, :type, :default => 'SELL'
  end
end
