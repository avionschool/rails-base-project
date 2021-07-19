class AddUsernameToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :username, :string
    add_index :admins, :username, unique: true
  end
end
