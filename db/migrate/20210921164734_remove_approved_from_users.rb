class RemoveApprovedFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :approved, :boolean
  end
end
