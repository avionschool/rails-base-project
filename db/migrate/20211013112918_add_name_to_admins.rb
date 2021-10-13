class AddNameToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :full_name, :string
    add_column :admins, :username, :string
  end
end
