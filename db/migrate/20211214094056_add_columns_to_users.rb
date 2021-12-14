class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_reference :users, :wallet, foreign_key: true
    add_column :users, :is_admin, :boolean
  end
end
