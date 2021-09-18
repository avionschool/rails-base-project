class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.integer :deposit
      t.integer :withdrawals
      t.integer :user_id
    end
  end
end
