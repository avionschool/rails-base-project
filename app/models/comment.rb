class Comment < ApplicationRecord
  validates :commenter_id, presence: true
  validates :body, presence: true

  belongs_to :item
end
