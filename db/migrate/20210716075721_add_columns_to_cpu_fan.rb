class AddColumnsToCpuFan < ActiveRecord::Migration[6.0]
  def change  
    add_column :cpu_fans, :name, :string
    add_column :cpu_fans, :image, :string
    add_column :cpu_fans, :supported_socket, :string, array: true
    add_column :cpu_fans, :height, :string
  end
end
