class Comment < ApplicationRecord
  validates :commenter_id, presence: true
  validates :body, presence: true

  belongs_to :item
  belongs_to :user, class_name: 'User', foreign_key: 'commenter_id', inverse_of: :comments
end
