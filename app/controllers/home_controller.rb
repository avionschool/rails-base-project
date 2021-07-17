class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect
  def index; end

  private

  def redirect
    redirect_to tours_path, notice: 'Succesfully Signed-in!' if agency_signed_in?
  end
end
