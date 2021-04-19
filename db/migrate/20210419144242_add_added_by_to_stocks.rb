class AddAddedByToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :added_by, :integer
  end
end
