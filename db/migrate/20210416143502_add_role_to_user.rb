class AddRoleToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.belongs_to :role
    end
    change_table :transactions do |t|
      t.belongs_to :stock
    end
    remove_column :users, :username, :string
    add_column :buyers_stocks, :volume, :integer, default: 0
    add_column :users, :cash, :decimal, default: 0
    add_column :transactions, :price, :decimal
    add_column :transactions, :fulfilled, :boolean, default: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
