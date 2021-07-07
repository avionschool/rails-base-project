class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :poster_id
      t.integer :commenter_id
      t.string :title
      t.text :description
      t.integer :rate_poster # rate given by commenter to poster
      t.integer :rate_commenter # rate given by poster to commenter
      t.timestamps
    end
  end
end
