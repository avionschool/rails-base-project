class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :user_username
      t.string :name
      t.string :food_group
      t.integer :user_id
      t.string :caption
      t.string :recipe_url
      t.timestamps
    end
  end
end
