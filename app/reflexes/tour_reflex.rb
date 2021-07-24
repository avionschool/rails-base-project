# frozen_string_literal: true

class TourReflex < ApplicationReflex
  def sort
    @sort_by = element.value
  end
end
