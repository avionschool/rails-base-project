class AddBrokerEmailToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :broker_email, :string
  end
end
