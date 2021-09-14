class AddWalletIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :wallet_id, :integer
  end
end
