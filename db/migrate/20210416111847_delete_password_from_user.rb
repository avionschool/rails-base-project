class DeletePasswordFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password
  end
end
