class RemoveBrokerIdFromTransaction < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :broker_email, :string
  end
end
