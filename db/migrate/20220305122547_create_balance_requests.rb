class CreateBalanceRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :balance_requests do |t|
      t.float :amount , null: false
      t.references :trader, null: false, foreign_key: true
      t.boolean :is_approved, default: false
      t.timestamps
    end
  end
end
