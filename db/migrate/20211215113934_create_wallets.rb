class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.float :balance
      t.integer :user_id

      t.timestamps
    end
  end
end
