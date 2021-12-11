class AddKindToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :kind, :string
  end
end
