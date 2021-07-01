class AddUserCash < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cash, :decimal
  end
end
