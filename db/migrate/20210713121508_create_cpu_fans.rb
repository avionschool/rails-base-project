class CreateCpuFans < ActiveRecord::Migration[6.0]
  def change
    create_table :cpu_fans do |t|
      t.string :fan_rpm
      t.string :noise_level
      t.string :radiator_size
      t.string :color
      t.string :rating
      t.float :price

      t.timestamps
    end
  end
end
