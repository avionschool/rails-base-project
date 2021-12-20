class AddUsernameConfirmationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :confirmed, :boolean, :default => false, :null => false
    add_index :users, :confirmed
  end
end
