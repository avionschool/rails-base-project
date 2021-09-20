class AddAdminToTrader < ActiveRecord::Migration[6.0]
  def change
    add_column :traders, :admin, :boolean, default: false
  end
end
