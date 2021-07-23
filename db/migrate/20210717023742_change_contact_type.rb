class ChangeContactType < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :contact_number, :string
  end
end
