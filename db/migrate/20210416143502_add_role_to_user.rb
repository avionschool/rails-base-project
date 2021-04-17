class AddRoleToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.belongs_to :role
    end
    remove_column :users, :username, :string
    add_column :buyers_stocks, :volume, :integer
    add_column :users, :cash, :decimal, default: 0
    add_column :transactions, :price, :decimal
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
