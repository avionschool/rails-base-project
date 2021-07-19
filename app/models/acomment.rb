class Acomment < ApplicationRecord
  validates :commenter, presence: true
  validates :body, presence: true
  belongs_to :article
end
