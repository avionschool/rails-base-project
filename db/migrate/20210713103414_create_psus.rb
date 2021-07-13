class CreatePsus < ActiveRecord::Migration[6.0]
  def change
    create_table :psus do |t|
      t.string :form_factor
      t.integer :efficiency_rating
      t.integer :wattage
      t.boolean :modular
      t.string :color
      t.string :rating
      t.float :price

      t.timestamps
    end
  end
end
