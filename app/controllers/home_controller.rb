class HomeController < ApplicationController
  before_action :redirect_if_not_loggedin, except: [:index]
  def index
  end

  def home

  end

end
