class AddSellerToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :seller, :string
  end
end
