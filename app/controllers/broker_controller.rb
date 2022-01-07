class BrokerController < ApplicationController
  before_action :authenticate_broker!

  def index
  end
end
