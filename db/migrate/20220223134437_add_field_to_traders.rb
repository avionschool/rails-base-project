class AddFieldToTraders < ActiveRecord::Migration[6.1]
  def change
      add_column :traders, :username, :string
      add_column :traders, :fullname, :string
      add_column :traders, :is_approved, :boolean, default: false
  end
end
