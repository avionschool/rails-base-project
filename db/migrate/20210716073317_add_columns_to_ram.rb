class AddColumnsToRam < ActiveRecord::Migration[6.0]
  def change  
    add_column :rams, :name, :string
    add_column :rams, :image, :string
    add_column :rams, :memory_type, :string
  end
end
