class AddUseridToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_reference :portfolios, :user, null: false, foreign_key: true
  end
end
