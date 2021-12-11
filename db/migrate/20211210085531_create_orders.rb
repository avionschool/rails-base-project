class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.decimal :price
      t.decimal :quantity
      t.boolean :filled, default: false

      t.references :wallet
      t.references :coin

      t.timestamps
    end
  end
end
