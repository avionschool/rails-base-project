class AddColumnsToCases < ActiveRecord::Migration[6.0]
  def change  
    add_column :cases, :name, :string
    add_column :cases, :image, :string
    add_column :cases, :motherboard_form_factor, :string, array: true

    rename_column :cases, :external_525_bays, :bay_2_5
    rename_column :cases, :internal_325_bays, :bay_3_5
  end
end
