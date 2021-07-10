class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :food_group_id
      t.integer :user_id
      t.integer :comment_id
      t.string :caption
      t.string :recipe_url
      t.timestamps
    end
  end
end
