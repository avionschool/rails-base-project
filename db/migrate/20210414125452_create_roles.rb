class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.integer :role_id
      t.string :role_name

      t.timestamps
    end
    add_index :roles, :role_id
  end
end
