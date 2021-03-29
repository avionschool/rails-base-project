class AddCategoryToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :category, :string
  end
end
