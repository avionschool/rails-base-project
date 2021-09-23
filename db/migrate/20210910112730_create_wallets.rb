class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.integer :user_id
      t.float :running_balance
      
      t.timestamps
    end
  end
end
