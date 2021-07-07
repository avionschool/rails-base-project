class RemoveCommentFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :comment, :text
  end
end
