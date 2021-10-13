class AddIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mainbook_id, :int
    add_column :users, :minibook_id, :int
  end
end
