class AddStockDescription < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :description, :string
  end
end
