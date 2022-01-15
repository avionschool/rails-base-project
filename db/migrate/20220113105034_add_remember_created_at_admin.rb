class AddRememberCreatedAtAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :remember_created_at, :datetime
  end
end
