class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.belongs_to :agency
      t.string :name
      t.decimal :price
      t.string :location
      t.integer :duration
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
