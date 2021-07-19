class AddingTransactIdColInItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :transact_id, :integer
  end
end
