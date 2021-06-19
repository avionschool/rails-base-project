class UpdatingUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :approved, :boolean
    add_column :users, :confirmable, :boolean
    add_column :users, :type, :string
  end
end
