class AddBrokerageFee < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :brokerage_fee, :decimal
  end
end
