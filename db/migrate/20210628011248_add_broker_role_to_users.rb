class AddBrokerRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :broker_role, :string
  end
end
