class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :total_amount
      t.integer :quantity
      t.decimal :price

      t.timestamps
      
      t.references :stock
      # t.references :user, null: true, default: nil, index: { name: "seller" }# SELL broker or seller
      t.references :seller, null: true, default: nil, foreign_key: { to_table: :users }# SELL broker or seller
      t.references :buyer, null: false, foreign_key: { to_table: :users } # BUY broker or buyer
    end
  end
end


# add_reference :transactions, :user, null: true
# # add_reference(:transactions, :user, index: { name: "buyer" })
# # add_foreign_key :transactions, :users, column: :seller
# add_foreign_key :transactions, :users, column: :buyer
# add_reference(:transactions, :users, null: true, index: { name: "seller" })
# add_reference(:transactions, :users, index: { name: "buyer" })