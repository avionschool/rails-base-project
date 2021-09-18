class AdminsController < ApplicationController
  def trader_settings
    @traders = User.all
  end

  def approvals
    @traders = User.all
  end

  # def transactions; end #uncomment once transaction models has been created
end
