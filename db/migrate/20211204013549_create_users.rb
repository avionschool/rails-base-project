class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :username
      t.text :password
      t.boolean :verified, default: false
      t.datetime :verified_at
      t.string :type
      t.json :portfolio
      t.string :payment_methods
      t.boolean :vip, default: false
      t.float :capital


      

      t.timestamps
    end
  end
end
