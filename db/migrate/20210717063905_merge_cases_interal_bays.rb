class MergeCasesInteralBays < ActiveRecord::Migration[6.0]
  def change
    remove_column :cases, :bay_2_5, :string
    remove_column :cases, :bay_3_5, :string

    add_column :cases, :internal_bays, :string, array: true
  end
end
