class AddLogoToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :logo, :string
  end
end
