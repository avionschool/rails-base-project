class ChangeDataTypeForContactNumberSuppliers < ActiveRecord::Migration[6.0]
  def up
    change_column :suppliers, :contact_number, :string
  end

  def down
    change_column :suppliers, :contact_number, :integer
  end
end
