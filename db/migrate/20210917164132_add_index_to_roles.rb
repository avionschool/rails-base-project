class AddIndexToRoles < ActiveRecord::Migration[6.0]
  def change
    add_index :roles, :role, unique: true
  end
end
