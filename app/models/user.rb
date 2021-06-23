class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  before_save :default_approved
  def default_approved
    if self.type != 'Broker'
        self.approved ||= true
    else
        self.approved ||= false
    end
  end

end
