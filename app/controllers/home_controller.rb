class HomeController < ApplicationController
  def index
    @items = Item.where(status: 'open').sort_by(&:created_at).reverse
  end
end
