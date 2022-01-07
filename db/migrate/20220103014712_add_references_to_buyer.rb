class AddReferencesToBuyer < ActiveRecord::Migration[6.0]
  def change
    add_reference :buyers, :admin, foreign_key: true
  end
end
