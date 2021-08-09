class AddUserIdToMyStock < ActiveRecord::Migration[6.0]
  def change
    # add_column :my_stocks, :user_id, :integer
    add_reference :my_stocks, :user, index:true
    # add_foreign_key :my_stocks, :users
  end
end
