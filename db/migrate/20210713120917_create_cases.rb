class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.string :type
      t.string :color
      t.boolean :power_supply
      t.string :side_panel_window
      t.integer :external_525_bays
      t.integer :internal_325_bays
      t.string :rating
      t.float :price

      t.timestamps
    end
  end
end
