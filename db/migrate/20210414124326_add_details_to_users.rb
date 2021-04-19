class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :transactions do |t|
      t.belongs_to :user
    end
    create_table :buyers_stocks, id: false do |t|
      t.bigint  "user_id"
      t.bigint  "stock_id"
    end

    add_index :buyers_stocks, [:user_id, :stock_id], unique: true
  end
end
