class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :agency
      t.belongs_to :tourist
      t.text :review
      t.decimal :rating
      t.timestamps
    end
  end
end
