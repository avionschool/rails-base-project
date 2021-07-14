class CreateNutritionalInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :nutritional_informations do |t|
      t.string :food_name
      t.integer :food_id
      t.string :label
      t.float :quantity
      t.string :unit
      t.timestamps
    end
  end
end
