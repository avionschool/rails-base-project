class LocationsController < ApplicationController
  def index 
    @location = current_user.locations.last
  end

  def create
    place = current_user.locations.new(location_params)
    if place.save 
      place1 = [place.street, place.suburb, place.city].compact.join(', ')
      place2 = [place.landmark, place.city].compact.join(', ')
      place3 = [place.suburb, place.city].compact.join(', ')
      results1 = Geocoder.search(place1)
      results2 = Geocoder.search(place2)
      results3 = Geocoder.search(place3)
      results4 = Geocoder.search(place.city)

      if results1.present?
        coords = results1.first.coordinates
      elsif results2.present?
        coords = results2.first.coordinates
      elsif results2.present?
        coords = results2.first.coordinates
      else
        coords = results4.first.coordinates
      end

      place.update(latitude: coords[0], longitude: coords[1])
      redirect_to edit_user_registration_path
    end
  end

  def update
    place = current_user.locations.new(location_params)
    if current_user.locations.first.update(location_params)
      place1 = [place.street, place.suburb, place.city].compact.join(', ')
      place2 = [place.landmark, place.city].compact.join(', ')
      place3 = [place.suburb, place.city].compact.join(', ')
      results1 = Geocoder.search(place1)
      results2 = Geocoder.search(place2)
      results3 = Geocoder.search(place3)
      results4 = Geocoder.search(place.city)

      if results1.present?
        coords = results1.first.coordinates
      elsif results2.present?
        coords = results2.first.coordinates
      elsif results2.present?
        coords = results2.first.coordinates
      else
        coords = results4.first.coordinates
      end

      current_user.locations.first.update(latitude: coords[0], longitude: coords[1])
      redirect_to edit_user_registration_path
    end
  end

  private

  def location_params
    params.require(:location).permit(:street, :suburb, :city, :landmark)
  end
end
