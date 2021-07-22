class HomeController < ApplicationController
  def index
    @conversations = current_user.conversations if user_signed_in?
    if user_signed_in?
      items = Item.where("user_id not in(?)",current_user.id)
      @items = items.where(status: 'open').sort_by(&:created_at).reverse if current_user.locations.first.nil?

      return if current_user.locations.first.nil?
      @items = current_user.items_from_user[0] + current_user.items_from_user[1]
    else
      @items = Item.where(status: 'open').sort_by(&:created_at).reverse
    end
  end
end
