class AddColumnStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :status, :string
  end
end
