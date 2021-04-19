class Role < ApplicationRecord
    TYPES = ['Buyer','Broker','Admin'].freeze
    validates :name, inclusion: {in: TYPES}
    has_many :users
end
