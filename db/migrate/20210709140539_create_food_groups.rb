class CreateFoodGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :food_groups do |t|
      t.string :food_name
      t.string :name
      t.timestamps
    end
  end
end
