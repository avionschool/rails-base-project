class AddCompanyNameToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :company_name, :string
  end
end
