class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :username, :full_name, :company, presence: true
  validates :username, length: { minimum: 6 }

  enum status: { free: 0, paid: 1 }

  # def to_s
  #   email
  # end

  # after_create do
  #   customer = Stripe::Customer.create(email: email)
  #   update(stripe_customer_id: customer.id)
  # end
  has_many :main_books, dependent: :destroy
end
