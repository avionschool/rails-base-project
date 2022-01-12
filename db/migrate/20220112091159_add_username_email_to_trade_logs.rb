class AddUsernameEmailToTradeLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :trade_logs, :email, :string
    add_column :trade_logs, :username, :string
  end
end
