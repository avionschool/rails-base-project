class AddApprovedToSupplier < ActiveRecord::Migration[6.0]
  def self.up
    add_column :suppliers, :approved, :boolean, :default => false, :null => false
    add_index  :suppliers, :approved
  end

  def self.down
    remove_index  :suppliers, :approved
    remove_column :suppliers, :approved
  end
end
