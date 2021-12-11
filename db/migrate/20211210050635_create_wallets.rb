class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.decimal :money
      t.boolean :verified, default: false
      t.datetime :verified_at
      t.decimal :pnl
      t.string :wallet_address
      # t.index :wallet_address
      t.references :user
      t.timestamps
    end
  end
end
