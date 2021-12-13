class Account < ApplicationRecord
	has_one :user
  	accepts_nested_attributes_for :user
  	enum role: { admin: "admin", broker: "broker", trader: "trader"}
end
