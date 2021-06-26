class UserStocksController < ApplicationController
  load_and_authorize_resource

  def my_portfolio; end

  def transactions; end
end
