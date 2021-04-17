class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    belongs_to :role
    has_and_belongs_to_many :stocks, join_table: "buyers_stocks", foreign_key: "stocks_id"

    #validates :username, presence: true
    validates :encrypted_password, presence: true
    #validates :username, length: {minimum: 4}
    #validates :username, length: {maximum: 32}
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP, message:"Valid emails only!" }

    def buy_stock(stock,volume)
      # Validate if user.role =  buyer/broker(?)
    end
    def sell_stock(stock,volume)
      # Validate if user.role = broker/buyer(?)
    end
end
