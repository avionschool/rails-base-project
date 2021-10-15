class MainBook < ApplicationRecord
  validates :date_mainb, presence: true
  validates :mainbook_description, presence: true
end
