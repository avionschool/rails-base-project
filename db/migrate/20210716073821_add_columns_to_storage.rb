class AddColumnsToStorage < ActiveRecord::Migration[6.0]
  def change  
    add_column :storages, :name, :string
    add_column :storages, :image, :string
  end
end

