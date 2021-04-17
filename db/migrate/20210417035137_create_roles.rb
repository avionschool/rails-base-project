class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :role_name

      t.timestamps
    end

    add_index :roles, :role_name, unique: true
  end
end
