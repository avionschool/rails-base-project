class RemoveReferenceFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :portfolio, foreign_key: true
  end
end
