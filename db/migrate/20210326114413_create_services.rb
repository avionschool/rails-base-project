class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :price
      t.string :type

      t.timestamps
    end
  end
end
