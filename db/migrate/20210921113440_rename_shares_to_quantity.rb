class RenameSharesToQuantity < ActiveRecord::Migration[6.0]
  def change
    rename_column :trades, :shares, :quantity
  end
end
