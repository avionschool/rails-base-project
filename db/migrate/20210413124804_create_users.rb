class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username, null:false
      t.string :email, null:false
      t.string :password, null:false
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

    create_table :transactions do |t|
      t.string :type
      t.integer :volume

      t.timestamps
    end
    create_table :stocks do |t|
      t.string :code
      t.string :name 

      t.timestamps
    endd
  end
end
