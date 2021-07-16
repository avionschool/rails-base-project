class AddColumnsToPsu < ActiveRecord::Migration[6.0]
  def change  
    add_column :psus, :name, :string
    add_column :psus, :image, :string
  end
end
