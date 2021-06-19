class ApplicationController < ActionController::Base
  devise_group :user, contains: %i[broker buyer]
end
