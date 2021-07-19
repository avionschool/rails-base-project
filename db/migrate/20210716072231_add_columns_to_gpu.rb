class AddColumnsToGpu < ActiveRecord::Migration[6.0]
  def change
    add_column :gpus, :name, :string
    add_column :gpus, :image, :string
    add_column :gpus, :memory_size, :string
    add_column :gpus, :memory_type, :string
  end
end
