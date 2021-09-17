class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :role
      t.index :role, unique: true
    end
  end
end
