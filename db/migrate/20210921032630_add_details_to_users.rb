class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :wallet_id, :integer
    add_column :users, :approved, :boolean
  end
end
