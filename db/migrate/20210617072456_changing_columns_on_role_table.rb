class ChangingColumnsOnRoleTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :roles, :user_id
  end
end
