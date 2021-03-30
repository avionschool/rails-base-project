class AddReferencesToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :service, foreign_key: true
    add_reference :reviews, :buyer, foreign_key: true
  end
end
