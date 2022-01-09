class AddReferenceToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :portfolio, foreign_key: true
  end
end
