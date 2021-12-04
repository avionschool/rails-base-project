class Admin < ApplicationRecord
    validates :username, :email, uniqueness: true, presence: true
    validates :fullname, presence: true
    validates :password, length: { minimum: 6 , message: "minimum 6 characters"}

end
