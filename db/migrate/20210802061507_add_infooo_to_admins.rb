class AddInfoooToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :current_sign_in_ip, :inet
    add_column :admins, :last_sign_in_ip, :inet
    add_column :admins, :failed_attempts, :integer, default: 0
  end
end
