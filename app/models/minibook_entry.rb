class MinibookEntry < ApplicationRecord
  validates :date_minib_entry, presence: true
  validates :minibook_entry_description, presence: true
  validates :or_vat_reg_tin_mainib, presence: true
end
