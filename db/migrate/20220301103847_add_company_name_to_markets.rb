class AddCompanyNameToMarkets < ActiveRecord::Migration[6.1]
  def change
    add_column :markets, :company_name, :string
  end
end
