class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :img
      t.string :role
      t.string :firstname
      t.string :lastname
      t.text :address
      t.string :contact_number
      t.boolean :is_verified

      t.timestamps
    end
  end
end
