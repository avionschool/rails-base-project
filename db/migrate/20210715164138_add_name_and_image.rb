class AddNameAndImage < ActiveRecord::Migration[6.0]
  def change
    add_column :cpus, :name, :string
    add_column :cpus, :image, :string
    add_column :mobos, :name, :string
    add_column :mobos, :image, :string
    add_column :gpus, :name, :string
    add_column :gpus, :image, :string
    add_column :psus, :name, :string
    add_column :psus, :image, :string
    add_column :rams, :name, :string
    add_column :rams, :image, :string
    add_column :storages, :name, :string
    add_column :storages, :image, :string
    add_column :cases, :name, :string
    add_column :cases, :image, :string
    add_column :case_fans, :name, :string
    add_column :case_fans, :image, :string
    add_column :cpu_fans, :name, :string
    add_column :cpu_fans, :image, :string
  end
end
