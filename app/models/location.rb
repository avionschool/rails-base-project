class Location < ApplicationRecord
  # geocoded_by :location
  # after_validation :geocode

  validates :street, :suburb, :city, :landmark, presence: true

  belongs_to :user, class_name: 'User'
end
