class CreateAbcProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :abc_products do |t|
      t.integer :user_id
      t.string :product_name
      t.float :product_price
      t.boolean :user_status

      t.timestamps
    end
  end
end
