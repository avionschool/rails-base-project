class RemoveUserIdFrom < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :user_id
    
  end
end
