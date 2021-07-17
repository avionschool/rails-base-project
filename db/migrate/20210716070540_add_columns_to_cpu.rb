class AddColumnsToCpu < ActiveRecord::Migration[6.0]
  def change
    add_column :cpus, :name, :string
    add_column :cpus, :image, :string
    add_column :cpus, :max_memory, :string
  end
end
