class ChangeDataTypeForContactNumberSuppliers < ActiveRecord::Migration[6.0]
  def self.up
    change_table :suppliers do |t|
      t.change :contact_number, :string
    end
  end
  def self.down
    change_table :suppliers do |t|
      t.change :contact_number, :integer
    end
  end
end
