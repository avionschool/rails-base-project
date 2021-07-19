class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :food_id
      t.string :commenter
      t.string :body
      t.timestamps
    end
  end
end
