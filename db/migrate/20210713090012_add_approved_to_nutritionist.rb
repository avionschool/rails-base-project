class AddApprovedToNutritionist < ActiveRecord::Migration[6.0]
  def change
    add_column :nutritionists, :approved, :boolean, default: false, null: false
    add_index :nutritionists, :approved
  end
end
