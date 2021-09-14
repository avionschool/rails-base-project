class DashboardController < ApplicationController
  before_action :authenticate_trader!
end
