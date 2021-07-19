class CreateCaseFans < ActiveRecord::Migration[6.0]
  def change
    create_table :case_fans do |t|
      t.string :size
      t.string :color
      t.string :rpm
      t.string :airflow
      t.string :noise_level
      t.boolean :pwm
      t.string :rating
      t.float :price
      
      t.timestamps
    end
  end
end
