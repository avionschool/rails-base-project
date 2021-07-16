class AddColumnsToMobo < ActiveRecord::Migration[6.0]
  def change  
    add_column :mobos, :name, :string
    add_column :mobos, :image, :string
    add_column :mobos, :supported_memory, :string
  end
end
