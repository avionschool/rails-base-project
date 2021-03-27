class AddNameCompanyContactToSupplier < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :first_name, :string
    add_column :suppliers, :last_name, :string
    add_column :suppliers, :company_name, :string
    add_column :suppliers, :contact_number, :integer
  end
end
