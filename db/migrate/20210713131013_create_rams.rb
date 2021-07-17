class CreateRams < ActiveRecord::Migration[6.0]
  def change
    create_table :rams do |t|
      t.string :speed
      t.string :module
      t.integer :latency
      t.integer :quantity
      t.string :color
      t.string :rating
      t.float :price

      t.timestamps
    end
  end
end
