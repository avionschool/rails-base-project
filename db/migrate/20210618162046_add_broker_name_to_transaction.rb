class AddBrokerNameToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :broker_name, :string
  end
end
