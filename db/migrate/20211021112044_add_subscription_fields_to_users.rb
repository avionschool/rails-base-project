class AddSubscriptionFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :plan, :string
  end
end
