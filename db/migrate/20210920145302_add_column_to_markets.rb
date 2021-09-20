class AddColumnToMarkets < ActiveRecord::Migration[6.0]
  def change
    add_column :markets, :logo_url, :string
  end
end
