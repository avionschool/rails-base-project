class CreateCpus < ActiveRecord::Migration[6.0]
  def change
    create_table :cpus do |t|
      t.string :socket
      t.integer :core_count
      t.integer :core_clock
      t.integer :boost_clock
      t.string :tdp
      t.boolean :smt
      t.string :rating
      t.float :price
      t.timestamps
    end
  end
end
