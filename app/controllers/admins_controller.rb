class AdminsController < ApplicationController
  def index
    @traders = Trader.where(is_approved: true)
  end
end
