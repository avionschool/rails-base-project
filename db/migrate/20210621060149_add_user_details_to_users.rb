class AddUserDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string, :limit => 30
    add_column :users, :last_name, :string, :limit => 30
    add_reference :users, :user_type, foreign_key: true
    add_column :users, :verified, :boolean
  end
end
