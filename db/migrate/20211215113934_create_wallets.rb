class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|

      t.timestamps
    end
  end
end
