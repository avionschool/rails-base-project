class Account < ApplicationRecord
	has_one :user
  	accepts_nested_attributes_for :user
end
