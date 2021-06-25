class ChangingStocksNameToCompany < ActiveRecord::Migration[6.0]
  def change
    rename_column :brokers_stocks, :name, :companyname
    rename_column :buyers_stocks, :name, :companyname
  end
end
