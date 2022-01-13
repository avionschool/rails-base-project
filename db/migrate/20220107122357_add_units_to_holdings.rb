class AddUnitsToHoldings < ActiveRecord::Migration[6.0]
  def change
    add_column :holdings, :units, :float
  end
end
