class ChangeSellerToNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :trades, :buy_order_id, true
  end
end
