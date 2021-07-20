class InsertingTransactIdToReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :title, :string
    add_column :reviews, :transact_id, :integer
  end
end
