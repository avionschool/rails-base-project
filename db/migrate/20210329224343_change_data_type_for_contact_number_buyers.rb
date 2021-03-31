class ChangeDataTypeForContactNumberBuyers < ActiveRecord::Migration[6.0]
  def up
    change_column :buyers, :contact_number, :string
  end

  def down
    change_column :buyers, :contact_number, :integer
  end
end
