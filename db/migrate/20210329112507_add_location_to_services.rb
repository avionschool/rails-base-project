class AddLocationToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :location, :string
  end
end
