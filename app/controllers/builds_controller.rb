class BuildsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @builds = Build.all
  end
end
