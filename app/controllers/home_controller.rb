class HomeController < ApplicationController
  def index
    @items = Item.where(status: 'open').sort_by(&:created_at).reverse
    @conversations = current_user.conversations if user_signed_in?
  end
end
