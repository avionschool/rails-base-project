class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
  after_create :set_user_status

  def set_user_status
    return user.pending!
  end
end