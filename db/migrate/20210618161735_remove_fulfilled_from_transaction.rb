class RemoveFulfilledFromTransaction < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :fulfilled, :boolean
  end
end
