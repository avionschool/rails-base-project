class AddsVolumeToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :volume, :integer
  end
end
