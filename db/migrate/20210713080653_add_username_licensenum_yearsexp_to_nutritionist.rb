class AddUsernameLicensenumYearsexpToNutritionist < ActiveRecord::Migration[6.0]
  def change
    add_column :nutritionists, :username, :string
    add_index :nutritionists, :username, unique: true
    add_column :nutritionists, :license_num, :integer
    add_column :nutritionists, :years_exp, :integer
  end
end
