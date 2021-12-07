class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { scope: 'username', message: 'should be unique', case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :fullname, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
  validates :email, presence: true, uniqueness: { scope: 'email', message: 'should be unique', case_sensitive: false }
end
