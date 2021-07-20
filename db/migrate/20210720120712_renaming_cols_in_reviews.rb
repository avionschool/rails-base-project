class RenamingColsInReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :poster_id, :integer
    remove_column :reviews, :commenter_id, :integer
    remove_column :reviews, :rate_poster, :integer
    remove_column :reviews, :rate_commenter, :integer

    add_column :reviews, :user1_id, :integer    # the item's owner
    add_column :reviews, :user2_id, :integer    # the one who 'bought' the item
    add_column :reviews, :user1_score, :integer
    add_column :reviews, :user2_score, :integer
  end
end
