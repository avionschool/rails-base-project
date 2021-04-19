class AddTypeToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :account_type, :string, default: "admin"
    add_column :brokers, :account_type, :string, default: "broker"
    add_column :buyers, :account_type, :string, default: "buyer"
  end
end
