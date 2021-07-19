class CreateMobos < ActiveRecord::Migration[6.0]
  def change
    create_table :mobos do |t|
      t.string :socket_cpu, array: true
      t.string :form_factor
      t.integer :max_memory
      t.integer :memory_slots
      t.string :color
      t.string :rating
      t.float :price

      t.timestamps
    end
  end
end
