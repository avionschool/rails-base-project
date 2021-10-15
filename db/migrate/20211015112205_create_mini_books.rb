class CreateMiniBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :mini_books do |t|
      t.integer :user_id
      t.string :minibook_name
      t.integer :minibook_price

      t.timestamps
    end
  end
end
