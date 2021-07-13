class CreateStorages < ActiveRecord::Migration[6.0]
  def change
    create_table :storages do |t|
      t.string :capacity
      t.string :type
      t.integer :cache
      t.string :form_factor
      t.string :interface
      t.string :rating
      t.float :price

      t.timestamps
    end
  end
end
