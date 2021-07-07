class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.integer :item_id
      t.text :comment
      t.timestamps
    end
  end
end
