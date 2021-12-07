class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      # creates role_id column which is a foreign_key id of a role
      t.references :role, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.string :username
      t.text :password
      t.string :email
      t.timestamps
    end
  end
end
