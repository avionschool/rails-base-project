class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :approved, :boolean, default: false
  end
end
