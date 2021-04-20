class Market < ApplicationRecord
    validates :name, presence: true, format: { without: /\s/ } # without space
    belongs_to :user
end
