class Stock < ApplicationRecord
    validates :name, presence: true, format: { without: /\s/ } # without space
    validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

    belongs_to :user
    has_many :transactions, dependent: :nullify

end
