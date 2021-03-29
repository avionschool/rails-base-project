class AddSupplierRefToServices < ActiveRecord::Migration[6.0]
  def change
    add_reference :services, :supplier, foreign_key: true
  end
end
