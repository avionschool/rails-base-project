class CreateBuilds < ActiveRecord::Migration[6.0]
  def change
    create_table :builds do |t|
      t.string :name
      t.string :purpose
      t.float :total_price

      t.references :user
      t.references :cpu
      t.references :gpu
      t.references :mobo
      t.references :psu
      t.references :storage
      t.references :case
      t.references :case_fan
      t.references :cpu_fan
      t.references :ram

      t.timestamps
    end
  end
end
