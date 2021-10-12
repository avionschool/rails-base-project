class RcPagesController < ApplicationController
  before_action :authenticate_review_center!

  def home; end
end
