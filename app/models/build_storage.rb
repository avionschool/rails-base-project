class BuildStorage < ApplicationRecord
  belongs_to :build
  belongs_to :storage
end
