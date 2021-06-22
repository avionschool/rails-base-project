class AddRoleIdToUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :role
    add_reference :users, :role, null: false, foreign_key: true
  end
end
