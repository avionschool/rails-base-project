class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :fullname
      t.string :email
      t.string :type
      
      t.boolean :verified, default: false
      t.datetime :verified_at

      t.timestamps
    end
  end
end
