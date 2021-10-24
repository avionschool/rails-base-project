class MainBook < ApplicationRecord
  validates :date_mainb, presence: true
  validates :mainbook_description, presence: true
  validates :or_vat_reg_tin_mainb, presence: true
  belongs_to :user
end
