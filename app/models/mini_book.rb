class MiniBook < ApplicationRecord
  # has_many :checkouts #, dependent: :destroy
  validates :minibook_name, presence: true
end
