class ChageCaseInternalBaysTypeToText < ActiveRecord::Migration[6.0]
  def change
    change_column :cases, :internal_bays, :text
  end
end
