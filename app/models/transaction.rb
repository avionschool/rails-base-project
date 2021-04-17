class Transaction < ApplicationRecord
    TYPES =  ['Buy','Sell'].freeze
    belongs_to :user, class_name: "user", foreign_key: "user_id"
    validates :type, inclusion: {in: TYPES}
    validates :volume, numericality: {greater_than_or_equal_to: 0}
end
