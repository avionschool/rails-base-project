class AddColumnsToCaseFan < ActiveRecord::Migration[6.0]
  def change  
    add_column :case_fans, :name, :string
    add_column :case_fans, :image, :string
  end
end
