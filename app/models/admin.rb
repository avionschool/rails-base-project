class Admin < ApplicationRecord
    validates :username, uniqueness:true, presence:true
    validates :fullname, presence:true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP , message:"enter a valid email address"} , presence:true
    validates :password, length: { minimum: 6 , message: "minimum 6 characters"}
    
    #add to forms <%= text_field :admin, :password_confirmation %>
end
