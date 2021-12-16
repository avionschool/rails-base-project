class AddFieldtoStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :current_price, :integer
    add_column :stocks, :logo_url, :string
    add_column :stocks, :name, :string
  end
end
