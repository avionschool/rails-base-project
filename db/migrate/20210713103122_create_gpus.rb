class CreateGpus < ActiveRecord::Migration[6.0]
  def change
    create_table :gpus do |t|
      t.string :chipset
      t.integer :core_clock
      t.integer :boost_clock
      t.string :color
      t.string :length
      t.string :rating
      t.float :price

      t.timestamps
    end
  end
end
