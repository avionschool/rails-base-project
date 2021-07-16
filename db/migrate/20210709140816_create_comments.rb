class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commentor
      t.boolean :like
      t.string :comment
      t.integer :article_id
      t.integer :food_id
      t.timestamps
    end
  end
end
