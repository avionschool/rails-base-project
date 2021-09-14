class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :code
      t.string :name
      t.float :current_price

      t.timestamps
    end
  end
end
