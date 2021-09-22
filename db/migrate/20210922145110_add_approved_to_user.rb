class AddApprovedToUser < ActiveRecord::Migration[6.0]
  def self.up
    add_column :users, :approved, :boolean, :default => false, :null => false
    add_index  :users, :approved
  end

  def self.down
    remove_index  :users, :approved
    remove_column :users, :approved
  end
end
