class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :status
      t.timestamps
    end
  end
end
