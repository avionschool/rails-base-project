class AddUsd24hToCoin < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :usd_24_h, :decimal
  end
end
