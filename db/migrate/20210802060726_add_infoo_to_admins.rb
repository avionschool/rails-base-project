class AddInfooToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :sign_in_count, :integer,  default: 0
    add_column :admins, :current_sign_in_at, :datetime
    add_column :admins, :last_sign_in_at, :datetime
    add_column :admins, :locked_at, :datetime
  end
end
