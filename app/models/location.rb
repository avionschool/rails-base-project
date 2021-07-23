class Location < ApplicationRecord
  # geocoded_by :location
  # after_validation :geocode

  validates :street, :suburb, :city, :landmark, presence: true

  belongs_to :user, class_name: 'User'

  def self.distance(lat1, lat2, long1, long2)
    Geocoder::Calculations.distance_between([lat1, long1], [lat2, long2])
  end
end
