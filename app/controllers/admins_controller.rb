class AdminsController < ApplicationController
  def approve_user
    @brokers = Broker.all
  end
end
