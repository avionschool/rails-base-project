class HomeController < ApplicationController
  def index
    @items = Item.where(status: 'open').sort_by(&:created_at).reverse
    if user_signed_in?
        @conversations = current_user.conversations
    end
  end
end
