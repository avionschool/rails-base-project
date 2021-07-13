class ChangingUserIdTypeInMessages < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :user_id, :string
    add_column :messages, :user_id, :integer
  end
end
