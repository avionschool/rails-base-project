class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.string :street
      t.string :suburb
      t.string :city
      t.string :landmark
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
