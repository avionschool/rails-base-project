class FixColumnNameMiniBookEntries < ActiveRecord::Migration[6.0]
  def change
    rename_column :minibook_entries, :or_vat_reg_tin_mainib, :or_vat_reg_tin_minib
  end
end
