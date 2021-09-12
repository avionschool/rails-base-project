class AddWalletIdToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :wallet_id, :integer
  end
end
