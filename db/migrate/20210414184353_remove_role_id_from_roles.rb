class RemoveRoleIdFromRoles < ActiveRecord::Migration[6.1]
  def change
    remove_column :roles, :role_id
  end
end
