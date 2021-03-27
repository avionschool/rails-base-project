class Supplier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :contact_number, presence: true, 
                                    numericality: { only_integer: true }, 
                                    length: { minimum: 10 }
        validates :company_name, presence: true
end
